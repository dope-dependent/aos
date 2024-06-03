import socket
import sys
import struct

# Server Application (Part A)
if __name__ == '__main__':
    addr = "0.0.0.0"        # Accept all connections
    port = 50001

    server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        server.bind((addr, port))
        print('server.py => Port successfully bound')
    except:
        print('server.py => Unable to bind')
        exit(1)
    
    while True:
        data, (caddr, cport) = server.recvfrom(4)
        integer = struct.unpack('I', data)[0]
        print(f"server.py => Received [{integer}] from [{caddr}] [{socket.gethostbyaddr(caddr)[0]}]", flush=True)
    




