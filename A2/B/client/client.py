import socket
import sys
import random
import time
import struct

WAIT_TIME=1
SLEEP_MIN=20
SLEEP_MAX=25
MULTIPLIER=10000

if __name__ == '__main__':
    
    if len(sys.argv) >= 4:
        WAIT_TIME = int(sys.argv[1])
        SLEEP_MIN = int(sys.argv[2])
        SLEEP_MAX = int(sys.argv[3])
        print(f'Updated WAIT_TIME [{WAIT_TIME}] SLEEP_MIN [{SLEEP_MIN}] SLEEP_MAX [{SLEEP_MAX}]', flush=True)
    

    saddr = "b-lb-1.b_default"
    sport = 50001
    client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    
    while True:
        time.sleep(WAIT_TIME)
        randint =  random.randrange(SLEEP_MIN, SLEEP_MAX)
        data = struct.pack('I', randint)
        print(f'client.py => Sending [{randint}] to [{socket.gethostbyname(saddr)}] [{saddr}]', flush=True)
        sbytes = client.sendto(data, (saddr, sport))
