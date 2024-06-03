# UDP Server to handle packets from load balancer
import threading
import time
import socket
import struct
import random
from concurrent.futures import ThreadPoolExecutor

MAX_THREADS  = 5
global totalSleepTime, sleepingThreads, criticalSectionMutex


def thread_target(data: float, server: socket.socket, caddr, cport):
    global totalSleepTime, sleepingThreads, criticalSectionMutex
    print(f'server.py [{threading.current_thread().name}] => I got the job!', flush=True)
    
    criticalSectionMutex.acquire()
    sleepingThreads += 1
    criticalSectionMutex.release()
    
    time.sleep(data)
    server.sendto(random.randbytes(1), (caddr, cport))      # Send back to the server
    
    criticalSectionMutex.acquire()
    totalSleepTime += data
    sleepingThreads -= 1
    criticalSectionMutex.release()  
    
    print(f'server.py [{threading.current_thread().name}] => Sleep Complete! Total Sleep Time : {totalSleepTime} seconds', flush=True)

if __name__ == '__main__':
    addr = "0.0.0.0"
    lb_addr = "b-lb-1.b_default"
    port = 50001
    server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    flen = len(struct.pack('I', 2))
    totalSleepTime = 0
    criticalSectionMutex = threading.Lock()
    sleepingThreads = 0
    try:
        server.bind((addr, port))
        print(f'server.py => Port {port} bound successfully', flush=True)
    except:
        print('server.py => Unable to bind! Terminating...', flush=True)
        exit(1)
    
    # Send ping packet to the load balancer, which remembers the MAC address
    print(f'server.py => Sending ping packet to [{lb_addr}] [{socket.gethostbyname(lb_addr)}]', flush=True)
    server.sendto(random.randbytes(1), (lb_addr, 50001))
    # In case the packet drops (shouldn't)
    print(f'server.py => Sending ping packet to [{lb_addr}] [{socket.gethostbyname(lb_addr)}]', flush=True)
    server.sendto(random.randbytes(1), (lb_addr, 50001))
    
    # Create thread pool of five threads
    thread_pool = ThreadPoolExecutor(max_workers=MAX_THREADS, thread_name_prefix='st')
    while True:
        data, (caddr, cport) = server.recvfrom(flen)
        if sleepingThreads == 5:
            # Error condition, load balancer should handle this
            print(f"server.py => Received data when no thread is free. Error in load balancer! Terminating...", flush=True)
            exit(1)
        
        if len(data) < flen:
            print(f'server.py => Unexpected Behaviour. UDP Should get the entire 4 byte text or nothing! Terminating...', flush=True)
            exit(1)
        else:
            # Send packet to the thread pool to execute
            data = struct.unpack('I', data)[0]
            print(f"server.py => Received [{data}] from [{caddr}] [{socket.gethostbyaddr(caddr)[0]}]", flush=True)
            rv = thread_pool.submit(thread_target, data, server, caddr, cport)

    thread_pool.shutdown(wait=True)