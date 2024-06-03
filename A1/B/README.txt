CREATED BY
	Rajas Bhatt (19CS30037)

FILE STRUCTURE
	19CS30037_Deque.c 	Contains the implementation of the Deque
	19CS30037_T1.cpp	Contains stress and correctness testing (t1)
	19CS30037_T2.cpp	Contains edge case checking according to assignment constraints (t2)
	Makefile
	README.txt	

COMPILATION
	To make the LKM (19CS30037_Deque.ko), do
		sudo su
		make

	To make the test files, do 
		make test

	To remove all executables, do
		make clean

INSERTING AND REMOVING THE LKM
	To insert the LKM, make the LKM first, then do
		insmod 19CS30037_Deque.ko

	To remove the LKM, do
		rmmod 19CS30037_Deque.ko

TESTING
	Ensure that the test files are compiled. If not, do
		make test

	Stress and Correctness (t1)
		./t1 <num_forks + 1>

	Edge Case
		./t2
