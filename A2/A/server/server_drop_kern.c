
#include <linux/types.h>
#include <sys/types.h>


#include <bpf_helpers.h>
#include <bpf_endian.h>

#include <linux/udp.h>
#include <linux/ip.h>
#include <linux/if_ether.h>
#include <linux/in.h>
#include <linux/bpf.h>

#define SERVER_PORT 50001

SEC("xdp")
int server_drop(struct xdp_md *info) {
    void *begin = (void *)(size_t)info->data;
    void *end = (void *)(size_t)info->data_end;

    bpf_printk("server_drop_kern.c : %d => Got something", __LINE__);
    struct ethhdr *eth = begin;
    if (begin + sizeof(struct ethhdr) > end) { // Not an ethernet header (?)
        bpf_printk("server_drop_kern.c : %d => Aborting", __LINE__);
        return XDP_ABORTED;
    }
    if (bpf_ntohs(eth->h_proto) != ETH_P_IP) {
        bpf_printk("server_drop_kern.c : %d => Pass non-IP packets", __LINE__);
        return XDP_PASS; // Pass all non-IP packets
    }
    struct iphdr *iph = begin + sizeof(struct ethhdr);  // Strip off ethernet header
    if (begin + sizeof(struct ethhdr) + sizeof(struct iphdr) > end) { // Not an IP header, drop
        bpf_printk("server_drop_kern.c : %d => Aborting", __LINE__);
        return XDP_ABORTED;
    }
    if (iph->protocol != IPPROTO_UDP) {
        bpf_printk("server_drop_kern.c : %d => Pass non-UDP packets", __LINE__);
        return XDP_PASS;  // Pass all non-TCP packets
    }
    struct udphdr *udph = begin + sizeof(struct ethhdr) + sizeof(struct iphdr);
    if (begin + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct udphdr) > end) { //drop
        bpf_printk("server_drop_kern.c : %d => Aborting", __LINE__);
        return XDP_ABORTED;
    }
    __u16 desport = bpf_ntohs(udph->dest);
    if (desport != SERVER_PORT) {
        bpf_printk("server_drop_kern.c : %d => UDP Packet Not to our port, passing!", __LINE__);
        return XDP_PASS;
    } 
    // Get payload 
    void *payload = begin + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct udphdr);
    if (payload + sizeof(__u32) > end) {
        bpf_printk("server_drop_kern.c : %d => UDP Packet Not 4 bytes, aborting!", __LINE__);
        return XDP_ABORTED;
    }
    __u32 data = *(__u32 *)payload;
    if (data % 2 == 0) {    // Drop even parity
        bpf_printk("server_drop_kern.c : %d => Data [%u] Parity [EVEN] DROPPING", __LINE__, data);
        return XDP_DROP;
    }
    else {
        bpf_printk("server_drop_kern.c : %d => Data [%u] Parity [ODD] PASSING", __LINE__, data);
        return XDP_PASS;
    }
    // Never reached
    return XDP_PASS;    
}

char LICENSE[] SEC("license") = "GPL";