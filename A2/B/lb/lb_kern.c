
#include <linux/types.h>
#include <sys/types.h>

#include <bpf_helpers.h>
#include <bpf_endian.h>

#include <linux/udp.h>
#include <linux/ip.h>
#include <linux/if_ether.h>
#include <linux/in.h>
#include <linux/bpf.h>
#include <string.h>


#define SERVER_PORT 50001
#define MAX_UDP_LENGTH 1480
// #define DEBUG

#define MAX_THREADS 5           // Max number of threads in backend
#define NUM_SERVERS 3           // Number of servers

struct backend_info {
    __u32 saddr;              // IP Address
    __u32 capacity;           // Capacity (in threads)
    __u16 sport;              // Port
    __u8 smac[ETH_ALEN];       // Backend's mac
};

/*
    MAPS NEEDED
    QUEUE
    SERVER_INDEX_MAX
    IP -> SERVER INDEX
    SERVER_INDEX -> backend_info
*/

// Count of the number of initialized servers
struct {
    __uint(type, BPF_MAP_TYPE_ARRAY);
    __type(key, __u32);                 // 0
    __type(value, __u32);               // IP
    __uint(max_entries, 1);
} lb_servers_init SEC(".maps");

// Map to store the thread capacity of each backend
struct {
    __uint(type, BPF_MAP_TYPE_ARRAY);
    __type(key, __u32);                 // Index
    __type(value, struct backend_info); // Info
    __uint(max_entries, NUM_SERVERS);
} lb_capacity SEC(".maps");

// Map IP of backend to index in the above array
struct {
    __uint(type, BPF_MAP_TYPE_HASH);
    __type(key, __u32);                 // IP
    __type(value, __u32);               // Index
    __uint(max_entries, NUM_SERVERS);
} lb_ip_to_index SEC(".maps");

//Map to store the queue, when all backends are full
struct {
    __uint(type, BPF_MAP_TYPE_QUEUE);
    __type(value, __u32);
    __uint(max_entries, 1024);
} lb_queue SEC(".maps");

// Calculate the value of ip_checksum
static __always_inline __u16 ip_checksum(unsigned short *buf, int bufsz) {
    unsigned long sum = 0;
    while (bufsz > 1) {
        sum += *buf;
        buf++;
        bufsz -= 2;
    }
    if (bufsz == 1) {
        sum += *(unsigned char *)buf;
    }
    sum = (sum & 0xffff) + (sum >> 16);
    sum = (sum & 0xffff) + (sum >> 16);
    return ~sum;
}

static __always_inline __u16 udp_checksum(struct iphdr *ip, struct udphdr * udp, void * data_end)
{
    __u16 csum = 0;
    __u16 *buf = (__u16*)udp;
    // Compute pseudo-header checksum
    csum += ip->saddr;
    csum += ip->saddr >> 16;
    csum += ip->daddr;
    csum += ip->daddr >> 16;
    csum += (__u16)ip->protocol << 8;
    csum += udp->len;
    
    // Compute checksum on udp header + payload
    for (int i = 0; i < MAX_UDP_LENGTH; i += 2) {
        if ((void *)(buf + 1) > data_end) {
            break;
        }
        csum += *buf;
        buf++;
    }

    if ((void *)buf + 1 <= data_end) {
       // In case payload is not 2 bytes aligned
        csum += *(__u8 *)buf;
    }

   csum = ~csum;
   return csum;
}


SEC("xdp")
int lb_kernel_code(struct xdp_md *info) {
    void *begin = (void *)(size_t)info->data;
    void *end = (void *)(size_t)info->data_end;
    struct ethhdr *eth = begin;
    if (begin + sizeof(struct ethhdr) > end) { // Not an ethernet header (?)
        return XDP_ABORTED;
    }
    if (bpf_ntohs(eth->h_proto) != ETH_P_IP) {
        return XDP_PASS; // Pass all non-IP packets
    }
    struct iphdr *iph = begin + sizeof(struct ethhdr);  // Strip off ethernet header
    if (begin + sizeof(struct ethhdr) + sizeof(struct iphdr) > end) { // Not an IP header, drop
        return XDP_ABORTED;
    }
    if (iph->protocol != IPPROTO_UDP) {
        return XDP_PASS;  // Pass all non-TCP packets
    }
    struct udphdr *udph = begin + sizeof(struct ethhdr) + sizeof(struct iphdr);
    if (begin + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct udphdr) > end) { //drop
        return XDP_ABORTED;
    }
    __u16 destport = udph->dest;
    if (bpf_ntohs(destport) != SERVER_PORT) {
        return XDP_PASS;
    }
    __u32 payload_size = end - (begin + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct udphdr));
    if (payload_size == 4) {
        bpf_printk("%d => [CLIENT PACKET]", __LINE__);
        // Check server with minimum number of threads
        __u32 key = 0;
        __u32 max_thr = 0, max_thr_ind = 0;
        __u32 *rv_value = (__u32 *)bpf_map_lookup_elem(&lb_servers_init, &key); 
        struct backend_info *b_info = NULL;
        if (rv_value == NULL || *rv_value == 0) {
            bpf_printk("%d => [QUEUE] Using queue, no server is available!", __LINE__);
            void *payload = begin + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct udphdr);
            if (payload + sizeof(__u32) > end) {
                return XDP_ABORTED;
            }
            long rv = bpf_map_push_elem(&lb_queue, payload, BPF_EXIST);
            if (rv < 0) {
                bpf_printk("%d => [QUEUE] Unable to push to queue, queue full ! Dropping Packet", __LINE__);
                return XDP_DROP;
            }
            bpf_printk("%d => [QUEUE] Using queue, packet successfully queued!", __LINE__);
            return XDP_DROP;
        }
        if (*rv_value >= 1) {
            // Get that server info
            b_info = (struct backend_info *)bpf_map_lookup_elem(&lb_capacity, &key);
            if (b_info == NULL) {
                bpf_printk("%d => Critical Error: Unable to get info of server [%u]! Dropping Packet", __LINE__, key);
                return XDP_DROP;
            }
            if (b_info->capacity > max_thr) {
                max_thr = b_info->capacity;
                max_thr_ind = key;
            }
            key++;
        }
        if (*rv_value >= 2) {
            // Get that server info
            b_info = (struct backend_info *)bpf_map_lookup_elem(&lb_capacity, &key);
            if (b_info == NULL) {
                bpf_printk("%d => Critical Error: Unable to get info of server [%u]! Dropping Packet", __LINE__, key);
                return XDP_DROP;
            }
            if (b_info->capacity > max_thr) {
                max_thr = b_info->capacity;
                max_thr_ind = key;
            }
            key++;
        }
        if (*rv_value >= 3) {
            // Get that server info
            b_info = (struct backend_info *)bpf_map_lookup_elem(&lb_capacity, &key);
            if (b_info == NULL) {
                bpf_printk("%d => Critical Error: Unable to get info of server [%u]! Dropping Packet", __LINE__, key);
                return XDP_DROP;
            }
            if (b_info->capacity > max_thr) {
                max_thr = b_info->capacity;
                max_thr_ind = key;
            }
            key++;
        } 
        
        if (max_thr == 0) {
            bpf_printk("%d => [QUEUE] All servers are busy! Using queue!", __LINE__);
            // Queue the packet
            void *payload = begin + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct udphdr);
            if (payload + sizeof(__u32) > end) {
                return XDP_ABORTED;
            }
            long rv = bpf_map_push_elem(&lb_queue, payload, BPF_EXIST);
            if (rv < 0) {
                bpf_printk("%d => [QUEUE] Unable to push to queue, queue full ! Dropping Packet", __LINE__);
                return XDP_DROP;
            }
            bpf_printk("%d => [QUEUE] Using queue, packet successfully queued!", __LINE__);
            return XDP_DROP;
        }
        else {
            //Send the packet to that server by changing some parameters
            //Change MAC addresses
            bpf_printk("%d => Updating the value of active threads in [%pI4] to %u", __LINE__, &b_info->saddr, b_info->capacity - 1);
            b_info = (struct backend_info *)bpf_map_lookup_elem(&lb_capacity, &max_thr_ind);
            if (b_info == NULL) {
                bpf_printk("%d => Critical Error: Unable to get info of server [%u]! Dropping Packet", __LINE__, key);
                return XDP_DROP;
            }
            b_info->capacity--;
            long rv_update = bpf_map_update_elem(&lb_capacity, &max_thr_ind, b_info, BPF_EXIST);
            if (rv_update < 0) {
                bpf_printk("%d => Critical Error: Unable to update active threads [%u]! Dropping Packet", __LINE__, key);
                return XDP_DROP;
            }
            
            bpf_printk("%d => Changing packet and sending to [%pI4]!", __LINE__, &b_info->saddr);
            memcpy(eth->h_source, eth->h_dest, ETH_ALEN * sizeof(__u8));         // load balancer becomes source
            memcpy(eth->h_dest, b_info->smac, ETH_ALEN * sizeof(__u8));       // server becomes destination
            // Change IP header
            iph->saddr = iph->daddr;
            iph->daddr = b_info->saddr;
            // Change UDP header
            udph->source = udph->dest;
            udph->dest = b_info->sport;
            iph->check = 0;
            iph->check = ip_checksum((__u16 *)iph, sizeof(struct iphdr));
            udph->check = 0;
            udph->check = udp_checksum(iph, udph, end);
            bpf_printk("%d => Successfully changed packet! Sending to [%pI4]", __LINE__, &iph->daddr);
            return XDP_TX;
        }        
    }
    else {
        bpf_printk("%d => [BACKEND PACKET]", __LINE__);
        // Check for first ping
        __u32 key = 0, insert_value = 0;
        // Check if the server with this IP exists, if not create entry in lb_ip_to_index
        __u32 srcip = iph->saddr;
        __u32 *index_value = (__u32 *)bpf_map_lookup_elem(&lb_ip_to_index, &srcip);
        if (index_value == NULL) { 
            // Server does NOT exist, store its metadata
            __u32 *rv_value = (__u32 *)bpf_map_lookup_elem(&lb_servers_init, &key);
            if (rv_value == NULL) insert_value = 0;
            else insert_value = *rv_value;

            // Add to lb_ip_to_index
            bpf_printk("%d => Updating lb_ip_to_index: new backend [%pI4]", __LINE__, &srcip);
            long index_rv = bpf_map_update_elem(&lb_ip_to_index, &srcip, &insert_value, BPF_ANY);
            if (index_rv < 0) {
                bpf_printk("%d => Error in adding to lb_ip_to_index! Dropping Packet!", __LINE__);
                return XDP_DROP;
            }
            bpf_printk("%d => Updating lb_capacity: new backend [%pI4]", __LINE__, &srcip);

            struct backend_info b_info;
            memset(&b_info, 0, sizeof(struct backend_info));
            b_info.capacity = 5;
            b_info.saddr = iph->saddr;
            b_info.sport = udph->source;
            memcpy(b_info.smac, eth->h_source, ETH_ALEN * sizeof(__u8));
            index_rv = bpf_map_update_elem(&lb_capacity, &insert_value, &b_info, BPF_ANY);
            if (index_rv < 0) {
                bpf_printk("%d => Error in updating lb_capacity! Dropping Packet!", __LINE__);
                return XDP_DROP;
            }

            insert_value++;
            bpf_printk("%d => Updating lb_servers_init: new backend [%pI4]", __LINE__, &srcip);
            index_rv = bpf_map_update_elem(&lb_servers_init, &key, &insert_value, BPF_ANY);
            if (index_rv < 0) {
                bpf_printk("%d => Error in updating lb_servers_init! Dropping Packet!", __LINE__);
                return XDP_DROP;
            }
            bpf_printk("%d => Successfully added new backend!", __LINE__, &srcip);
            return XDP_DROP;
        }
        // Get contents of that backend
        struct backend_info *rv = (struct backend_info *)bpf_map_lookup_elem(&lb_capacity, index_value);
        if (rv == NULL) {
            // Should never happen, this means that server was not added properly
            bpf_printk("%d => Error in EBPF CODE: Failed to add entry for server", __LINE__);
            return XDP_DROP;
        }
        else {
            //Check if queue is empty, if not then increment thread capacity
            __u32 qt;
            long rv_pop = bpf_map_pop_elem(&lb_queue, &qt);
            if (rv_pop < 0) {
                // Failure to pop, increment thread count
                if (rv->capacity < MAX_THREADS) {
                    rv->capacity++;
                    bpf_printk("%d => Incrementing Capacity at [%pI4] to %u", __LINE__, &srcip, rv->capacity);
                }
                else { // Will rarely happen, happens once when servers send their ping twice
                    bpf_printk("%d => Cannot increment capacity at [%pI4] beyond %u", __LINE__, &srcip, rv->capacity);
                }
                // Key should exist in the map
                long rvl = bpf_map_update_elem(&lb_capacity, index_value, rv, BPF_EXIST);
                if (rvl < 0) {
                    bpf_printk("%d => Error in incrementing capacity of server!", __LINE__);
                    return XDP_DROP;
                }
                return XDP_DROP;
            }
            else {
                // Extend packet by 3 bytes to support 4 byte payload
                bpf_printk("%d => Extending payload tail and sending to [%pI4]", __LINE__, &srcip);
                long tail_adj_rv = bpf_xdp_adjust_tail(info, 3);
                if (tail_adj_rv < 0) {
                    bpf_printk("%d => Error in extending tail of ping packet from [%pI4]. Dropping ping packet!", __LINE__, &srcip);
                    return XDP_DROP;
                }

                void *p_begin = (void *)(size_t)info->data;     
                void *p_end = (void *)(size_t)info->data_end;

                struct ethhdr *p_eth = p_begin;
                // Mandatory verifier checks
                if (p_begin + sizeof(struct ethhdr) > p_end) { // Not an ethernet header (?)
                    return XDP_ABORTED;
                }
                struct iphdr *p_iph = p_begin + sizeof(struct ethhdr);

                if (p_begin + sizeof(struct ethhdr) + sizeof(struct iphdr) > p_end) { // Not an IP header, drop
                    return XDP_ABORTED;
                }

                struct udphdr *p_udph = p_begin + sizeof(struct ethhdr) + sizeof(struct iphdr);
                if (p_begin + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct udphdr) > p_end){
                    return XDP_ABORTED;
                }
                                    
                // // Change MAC addresses
                memcpy(p_eth->h_source, p_eth->h_dest, ETH_ALEN * sizeof(__u8));   // Source becomes destination
                memcpy(p_eth->h_dest, rv->smac, ETH_ALEN * sizeof(__u8));          // Destination changes

                // Change IP and TCP headers
                p_iph->saddr = p_iph->daddr;        // Source becomes destination
                p_iph->daddr = rv->saddr;           // Destination changes

                p_iph->check = 0;                   // Zero the checksum
                p_udph->check = 0;                  
                
                p_iph->tot_len = bpf_htons(p_end - (void *)p_iph);
                p_udph->len = bpf_htons(p_end - (void *)p_udph);

                p_udph->source = p_udph->dest;      // Change port although it should not matter in this case
                p_udph->dest = rv->sport;           // Change port

                p_iph->check = ip_checksum((__u16 *)p_iph, sizeof(struct iphdr));
                p_udph->check = udp_checksum(p_iph, p_udph, p_end);

                // Copy modified packet into the current struct
                void *p_data = p_begin + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct udphdr);
                if (p_data + sizeof(__u32) > p_end) {
                    return XDP_ABORTED;
                }
                memcpy(p_data, &qt, sizeof(__u32));
                // Send it back
                bpf_printk("%d => Modified retrieved packet and sending to [%pI4]", __LINE__, &srcip);
                return XDP_TX;
            }
        }
        return XDP_DROP;
        // } 
    }
    // Never reached
    return XDP_PASS;
}

char LICENSE[] SEC("license") = "GPL";