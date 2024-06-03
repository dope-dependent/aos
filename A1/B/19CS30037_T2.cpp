/* Edge Case Test for 19CS30037_Deque.c */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <wait.h>

#include <bits/stdc++.h>

const char procname[] = "/proc/partb_1_19CS30037";

using namespace std;

int main(int argc, char *argv[])
{
    int testcnt = 1, queueSize = 2048, recv, fd, fd2, intTemp, intTemp2;
    long long longlongTemp;
    char queueSize1 = 102;
    fd = open(procname, O_RDWR);
    if (fd < 0) {
        cout << "Unable to open file\n" << endl;
        return 1;
    }
    // send more than 1 bytes initialization
    cout << "[" << right << setw(2) << testcnt++ << left << setw(40) << "] Send more than 1 byte max size ";
    queueSize = 2048;
    recv = write(fd, (char *)&queueSize, sizeof(queueSize));
    if (recv == -1 && errno == EINVAL) cout << "[AC]" << endl;
    else cout << "[WA]" << endl;
    
    // size of queue is more than 100
    queueSize1 = 102;
    cout << "[" << right << setw(2) << testcnt++ << left << setw(40) << "] Queue Capacity > 100 ";
    recv = write(fd, &queueSize1, sizeof(queueSize1));
    if (recv == -1 && errno == EINVAL) cout << "[AC]" << endl;
    else cout << "[WA]" << endl;
    
    // size is 0
    queueSize1 = 0;
    cout << "[" << right << setw(2) << testcnt++ << left << setw(40) << "] Queue Capacity == 0 ";
    recv = write(fd, &queueSize1, sizeof(queueSize1));
    if (recv == -1 && errno == EINVAL) cout << "[AC]" << endl;
    else cout << "[WA]" << endl;

    // proper initialization
    queueSize1 = 100;
    cout << "[" << right << setw(2) << testcnt++ << left << setw(40) << "] Queue Size == 100 ";
    recv = write(fd, &queueSize1, sizeof(queueSize1));
    if (recv == 0) cout << "[AC]" << endl;
    else cout << "[WA]" << endl;

    // insert long long
    longlongTemp = 18492384923;
    cout << "[" << right << setw(2) << testcnt++ << left << setw(40) << "] long long insert ";
    recv = write(fd, (char *)&longlongTemp, sizeof(longlongTemp));
    if (recv == -1 && errno == EINVAL) cout << "[AC]" << endl;
    else cout << "[WA]" << endl;

    // insert char
    queueSize1 = 100;
    cout << "[" << right << setw(2) << testcnt++ << left << setw(40) << "] char insert ";
    recv = write(fd, &queueSize1, sizeof(queueSize1));
    if (recv == -1 && errno == EINVAL) cout << "[AC]" << endl;
    else cout << "[WA]" << endl;

    // successful entry
    intTemp = rand();
    cout << "[" << right << setw(2) << testcnt++ << left << setw(40) << "] int insert ";
    recv = write(fd, (char *)&intTemp, sizeof(intTemp));
    if (recv == 4) cout << "[AC]" << endl;
    else cout << "[WA]" << endl;

    // successful exit
    cout << "[" << right << setw(2) << testcnt++ << left << setw(40) << "] int remove ";
    recv = read(fd, (char *)&intTemp2, sizeof(intTemp2));
    if (recv == 4) {
        if (intTemp2 == intTemp) cout << "[AC]" << endl;
        else cout << "[WA]" << endl;
    }
    else cout << "[WA]" << endl;

    // remove from empty deque
    cout << "[" << right << setw(2) << testcnt++ << left << setw(40) << "] empty deque removal ";
    recv = read(fd, (char *)&intTemp2, sizeof(intTemp2));
    if (recv == -1 && errno == EACCES) cout << "[AC]" << endl;
    else cout << "[WA]" << endl;

    // insert into full deque
    cout << "[" << right << setw(2) << testcnt++ << left << setw(40) << "] full deque insert ";
    for (int i = 0; i < 101; i++) {
        if (i == 100) {
            intTemp = rand();
            recv = write(fd, (char *)&intTemp, sizeof(intTemp));
            if (recv == -1 && errno == EACCES) {
                cout << "[AC]" << endl;
            }
            break; 
        }
        else {
            intTemp = rand();
            recv = write(fd, (char *)&intTemp, sizeof(intTemp));
            if (recv != 4) {
                cout << "[WA]" << endl;
                break;
            }
        }        
    }

    // open file while existing exists
    cout << "[" << right << setw(2) << testcnt++ << left << setw(40) << "] multiple file test ";
    fd2 = open(procname, O_RDWR);
    if (fd2 < 0) {
        cout << "[AC]" << endl;
    }
    else cout << "[WA]" << endl;
    close(fd);
    // Close and open again
    return 1;
}