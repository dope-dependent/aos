/* Correctness Test for 19CS30037_Deque.c */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <wait.h>

#include <bits/stdc++.h>

#define OPS 1000
#define MAXSIZE 100
// #define DEBUG

const char procname[] = "/proc/partb_1_19CS30037";

using namespace std;

int main(int argc, char *argv[])
{
    pid_t pid;
    for (int i = 0; i < stoi(argv[1]); i++)
        pid = fork();

    if (pid == 0)
    {
		srand(time(NULL));
        int fd = open(procname, O_RDWR);
        if (fd < 0) {
        	cout << getpid() << " [AC] Unable to open file" << "\n";
        	exit(EXIT_SUCCESS);
        }
        deque<int> dq;
        srand(time(NULL));
        int len = rand() % (MAXSIZE + 10);
        int recv = write(fd, (char *)&len, sizeof(char));
        if (errno == EINVAL && len > 100) {
        	cout << getpid() << " [AC] Len check success" << "\n";
        	exit(EXIT_SUCCESS);
        } 
        else if (errno == EINVAL) {
        	cout << getpid() << " [WA] Len check failed" << "\n";
        	exit(EXIT_FAILURE);
        }
        int w = 0, r = 0;
        for (int numq = 0; numq < OPS; numq++) {
        	srand(time(NULL));
        	int op = rand() % 2;
        	if (op == 0) {	// write
        		srand(time(NULL));
        		int num = rand();
        		int out = write(fd, (char *)&num, sizeof(int));
        		#ifdef DEBUG
        		cout << getpid() << " W " << num << " ";
        		cout << out << endl;
        		#endif
        		if ((int)dq.size() >= len) {
        			if (out != -1 || errno != EACCES) {
        				cout << getpid() << " [WA] Write into full deque ";
        				cout << " W [" << w << "] R [" << r << "]" << endl;
        				exit(EXIT_FAILURE);
        			}
        		}
        		else {
        			if (num % 2 == 0) dq.push_back(num);
        			else dq.push_front(num);
        			w++;
        		}        		
        	}
        	else {
        		int x, out;
        		out = read(fd, (char *)&x, sizeof(int));
        		#ifdef DEBUG
        		cout << getpid() << " R ";
        		cout << out << " ";
        		#endif
        		if (dq.size() == 0) {
        			if (out != -1 || errno != EACCES) {
        				cout << getpid() << " [WA] Read from empty deque";
        				cout << " W [" << w << "] R [" << r << "]" << endl;
        				exit(EXIT_FAILURE);
        			}
        		}
        		else {
        			if (dq.front() != x) {
        				cout << getpid() << " [WA] Wrong value removed (";
        				cout << x << ") should be (" << dq.front() << ")";
        				cout << " W [" << w << "] R [" << r << "]" << endl;
        				exit(EXIT_FAILURE);
        			}
        			dq.pop_front();
        			r++;
        		}
        	}
        }
        cout << getpid() << " [AC]" << "\n";        
        close(fd);
    }
    else
    {
        waitpid(pid, NULL, 0);
        // printf("Closed Process: [%u]\n", pid);
        fflush(stdout);
    }

}