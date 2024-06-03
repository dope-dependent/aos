SUBMITTED BY    
    Rajas Bhatt
    19CS30037


DIRECTORY STRUCTURE
    A/
        client/
            client.py
            Dockerfile
        server/
            libbpf/                 
            Dockerfile.lb 
            Makefile
            server_drop_kern.c
            server_drop_user.c
            server.py 
            start.sh
        docker-compose.yml
    B/
        client/
            client.py
            Dockerfile
        server/
            server.py
            Dockerfile 
        lb/
            libbpf/
            lb_kern.c 
            Dockerfile.lb
            Makefile
            start.sh
        docker-compose.yml
    
    A2.pdf
    README.txt


HOW TO RUN
    PART A 
        RUNNING ORDER 
            server -> client
        
        CLIENT
            Simple client which sends 0, 1, 2, 3, ..., etc to the server 
            sudo docker compose up --build c

        SERVER  
            Contains of a python UDP server (server.py) and an EBPF program server_drop_kern.c 
            which drops all even packets and passes all odd packets
            
            Can mount this in 2 ways 

            For the bare python server which starts with the EBPF program not mounted, do 
                command: sh /server/start.sh 0
            
            in docker-compose.yaml, to mount the program do 
                sudo docker compose exec -it a-s-1 bash 
                cd /server 
                make xdp_init
            
            To see kernel debug do 
                cat /sys/kernel/debug/tracing/trace_pipe
            
            You will see packets being dropped in the python app, to remove program do 
                make clean 
            
            For the server with the ebpf program mounted already, do 
                command: sh /server/start.sh 1
            
            You will see both kernel debug output and python application output in the same terminal 



    PART B
        RUNNING ORDER 
            load balancer -> server -> client 

        For ease in viewing, open three seperate terminals
            - One for load balancer (should be wide enough)
            - One for client
            - One for server(s)

        CLIENT 
            You can give command line arguments to client.py in docker-compose.yml located in B/
            by changing the command 

                c: 
                    build: 
                    dockerfile: ./client/Dockerfile
                    context: .
                    command: python3 client.py <WAIT_TIME> <SLEEP_MIN> <SLEEP_MAX>
                    depends_on:
                    - lb

            To up the client, write 
                sudo docker compose up --build c
        
        SERVER 
            By default, three servers s1, s2 and s3 have been made in the dockerfile 
            I have not hardcoded their addresses
            On starting, they will send a small UDP packet of 1 byte to the load balancer
            Load balancer will add them in its storage (map)
            
            I have used concurrent.features.ThreadPoolExecuter to mimic thread creation
            The main thread receives the UDP packet from the load balancer 
            ThreadPoolExecuter.submit() submits the data inside the packet to some thread 
            inside the pool then after completion this thread submits data to the load balancer

            To up the servers
                sudo docker compose up --build s1 s2 s3


        LOAD BALANCER
            Load balancer does what it is expected to do 
            Seperation between clients and servers is done on the basis of the size of the payload 

            To up the load balancer     
                sudo docker compose up --build lb 







    
