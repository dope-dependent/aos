obj-m += 19CS30037_Deque.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) modules

clean:
	rm -rf *.o *.ko *.mod* *.symvers *.order .*.cmd t1 t2 .tmp*

test: t1 t2

t1: 19CS30037_T1.cpp
	g++ 19CS30037_T1.cpp -o t1

t2: 19CS30037_T2.cpp
	g++ 19CS30037_T2.cpp -o t2
