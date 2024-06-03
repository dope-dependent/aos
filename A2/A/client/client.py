import socket
import time
import struct

WAIT_TIME=3

if __name__ == '__main__':
    saddr = "a-s-1.a_default"
    sport = 50001

    client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    count = 0
    while True:
        time.sleep(WAIT_TIME)
        data = struct.pack('I', count)
        print(f'client.py => Sending [{count}] to [{socket.gethostbyname(saddr)}] [{saddr}]', flush=True)
        sbytes = client.sendto(data, (saddr, sport))
        count += 1
    client.close()
    




