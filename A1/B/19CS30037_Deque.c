#include <linux/init.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/proc_fs.h>
#include <linux/types.h>
#include <linux/slab.h>
#include <linux/sched.h>
#include <linux/mutex.h>
#include <linux/uaccess.h>
#include <linux/errno.h>
#include <linux/string.h>


MODULE_AUTHOR("Rajas Bhatt");
MODULE_DESCRIPTION("Double Ended Queue");
MODULE_LICENSE("GPL");
MODULE_VERSION("0.1");

#define FILENAME "partb_1_19CS30037"
// IMPORTANT: PROCESS_HT_SIZE ALWAYS SHOULD BE A POWER OF 2
#define PROCESS_HT_SIZE 1024    
#define LOG_PROCESS_HT_SIZE 10
 
#define DEQUE_MIN_VALUE 1
#define DEQUE_MAX_VALUE 100
#define MAX_BUFFER_LEN 256

DEFINE_MUTEX(fileMutex);	// File open/close
// DEFINE_MUTEX(writeMutex);	// Buffer write

/* */
int loopIter, errCode, currentPID;

/* Deque Data Structures */
struct Deque {
	int maxSize;
	int size;
	int left;
	int right;
	int *data;
};

/* Process Data Structure */
enum ProcessState {
	PROC_INIT = 1,			// Process initialized, deque uninitialized
	PROC_WRITING = 2		// Process and deque initialized
};

struct ProcessNode {
	int pid;
	enum ProcessState processState;
	struct ProcessNode *nextProcess;
	struct Deque *processDeque;
} *currProcessNode, *prevProcessNode;

void HelperStringCopy(char *dest, const char *src, size_t count) {
	while (count--) {
		*dest = *src;
		dest++;
		src++;
	}
}

struct ProcessNode *allProcesses[PROCESS_HT_SIZE];
size_t numProcesses = 0;

/* Buffer Data Structure */
char *buffer = NULL;
char *spareBuffer = NULL;
ssize_t bufferLength = 0;


/* Deque Functions */
struct Deque *DequeCreateDeque(int dequeCapacity);
int  DequeInsertIntoDeque(struct Deque *deque, int data);
int  DequeDeleteFromDeque(struct Deque *deque, int *data);
void  DequeFreeDeque(struct Deque *deque);


/* Process Functions */
static int ProcessFileOpen(struct inode *node, struct file *file); // TBT
static ssize_t ProcessFileRead(struct file *file, char __user *user, size_t size, loff_t *loffset);
static ssize_t ProcessFileWrite(struct file *file, const char __user *user, size_t size, loff_t *loffset);
static int ProcessFileRelease(struct inode *node, struct file *file);
void ProcessFreeNode(struct ProcessNode *node); // TBT
struct ProcessNode *ProcessGetNode(int pid);


/* Define the file operations */
static const struct proc_ops fileOperations = {
	.proc_open = ProcessFileOpen,
	.proc_read = ProcessFileRead,
	.proc_write = ProcessFileWrite,
	.proc_release = ProcessFileRelease
};

/* --------------------- KERNEL FUNCTIONS ------------------------------------------- */

static int DequeLKMInit(void) {
	struct proc_dir_entry *procEntry = proc_create(FILENAME, 0666, NULL, &fileOperations);
	
	if (procEntry == NULL) {
		printk("DequeLKMInit: Unable to craeate proc_dir_entry\n");			
		return -ENOENT;
	}	
	
	// Initialize the hash table of all processes
	for (loopIter = 0; loopIter < PROCESS_HT_SIZE; loopIter++) 
		allProcesses[loopIter] = (struct ProcessNode *)NULL;
		
	
	// Allocate R/W buffer space
	buffer = (char *)kmalloc(MAX_BUFFER_LEN * sizeof(char), GFP_KERNEL);
	if (buffer == NULL) {
		printk("DequeLKMInit: Unable to create buffer\n");
		return -ENOENT;
	}
	printk(KERN_ALERT "DequeLKMInit: Deque LKM inserted successfully\n");
	return 0;
}

static void DequeLKMExit(void) {
	remove_proc_entry(FILENAME, NULL);	
	
	// Free HT of Processes
	for (loopIter = 0; loopIter < PROCESS_HT_SIZE; loopIter++) {
		currProcessNode = allProcesses[loopIter];
		while (currProcessNode != NULL) {
			prevProcessNode = currProcessNode;
			currProcessNode = currProcessNode->nextProcess;
			ProcessFreeNode(prevProcessNode);
		}
	}
	numProcesses = 0;
	
	// Free R/W buffer space
	kfree(buffer);
	bufferLength = 0;
	printk(KERN_ALERT "DequeLKMExit: Deque LKM removed successfully\n");
}

/* --------------------- PROCESS FUNCTIONS ------------------------------------------ */

/* Free Process Node */
void ProcessFreeNode(struct ProcessNode *node) {
	if (node == NULL) return;
	DequeFreeDeque(node->processDeque);
	kfree(node);
}

/* Retrieve Process Node */
struct ProcessNode *ProcessGetNode(int pid) {
	currProcessNode = allProcesses[pid & (PROCESS_HT_SIZE - 1)];
	while (currProcessNode != NULL) {
		if (currProcessNode->pid == pid) return currProcessNode;
		currProcessNode = currProcessNode->nextProcess;
	}
	// Code should NOT go here 
	printk(KERN_ALERT "ProcessGetNode: Accessing node which does not exist\n");
	return NULL;
}

/* Process Opens a file */
int ProcessFileOpen(struct inode *node, struct file *file) {
	int localVariable;
	mutex_lock(&fileMutex);
	errCode = 0;
	currentPID = current->pid;
	currProcessNode = allProcesses[currentPID & (PROCESS_HT_SIZE - 1)];
	prevProcessNode = NULL;
	// Try to traverse the hash map
	while (currProcessNode != NULL) {
		if (currProcessNode->pid == currentPID) {
			errCode = -EINVAL;
			printk(KERN_ALERT "ProcessFileOpen: Process already exists\n");
			goto ProcessFileOpenExit;
		}
		prevProcessNode = currProcessNode;
		currProcessNode = currProcessNode->nextProcess;
	}
	
	currProcessNode = (struct ProcessNode *)kmalloc(sizeof(struct ProcessNode), GFP_KERNEL);
	// Memory not allocated
	if (currProcessNode == NULL) {
		errCode = -EINVAL;
		printk(KERN_ALERT "ProcessFileOpen: Unable to allocate memory for process\n");
		goto ProcessFileOpenExit;
	}
	// Add data to the node
	currProcessNode->processState = PROC_INIT;
	currProcessNode->pid = currentPID;
	currProcessNode->nextProcess = NULL;
	currProcessNode->processDeque = NULL;
	// If prev = NULL, HT entry is NULL hence add directly, else
	if (prevProcessNode == NULL) allProcesses[currentPID & (PROCESS_HT_SIZE - 1)] = currProcessNode;
	else {
		prevProcessNode->nextProcess = currProcessNode;
		printk(KERN_INFO "Adding %d after %d\n", currentPID, prevProcessNode->pid);
	}
	numProcesses++;
	
ProcessFileOpenExit:
	localVariable = errCode;
	mutex_unlock(&fileMutex);
	return localVariable;
}

/* Process Reads from file */
ssize_t ProcessFileRead(struct file *file, char __user *userBuffer, size_t size, loff_t *loffset) {
	int localVariable, poppedElement = 0;
	mutex_lock(&fileMutex);
	errCode = 0;
	currentPID = current->pid;
	currProcessNode = ProcessGetNode(currentPID);
	if (currProcessNode == NULL) {
		printk(KERN_ALERT "ProcessFileRead: Process %d not found\n", currentPID);
		errCode = -EINVAL;
		goto ProcessFileReadExit;
	}
	if (userBuffer == NULL || size == 0 || size > MAX_BUFFER_LEN) {
		printk(KERN_ALERT "ProcessFileRead: Improper Size of Query\n");
		errCode = -EACCES;
		goto ProcessFileReadExit;
	}
	if (currProcessNode->processState == PROC_INIT) {
		// Cannot read from empty dequeue
		printk(KERN_ALERT "ProcessFileRead: Cannot read from uninitialized dequeue\n");
		errCode = -EACCES;
		goto ProcessFileReadExit;
	}
	errCode = DequeDeleteFromDeque(currProcessNode->processDeque, &poppedElement);
	if (errCode == sizeof(int)) {
		HelperStringCopy(buffer, (const char *)&poppedElement, sizeof(int));
		bufferLength = sizeof(poppedElement);
		buffer[bufferLength] = '\0';
		if (copy_to_user(userBuffer, buffer, bufferLength)) {
			errCode = -EACCES;
			printk(KERN_ALERT "ProcessFileRead: Unable to write into user buffer\n");
			goto ProcessFileReadExit;
		}
	}
	else errCode = -EACCES;
	// printk(KERN_INFO "%d ProcessFileRead: Removing %d\n", currentPID, poppedElement);

ProcessFileReadExit:
	localVariable = errCode;
	// printk(KERN_INFO "%d ProcessFileRead: EC : %d\n", currentPID, errCode);
	mutex_unlock(&fileMutex);
	return localVariable;
}

/* Process Writes to file */
ssize_t ProcessFileWrite(struct file *file, const char __user *userBuffer, size_t size, loff_t *loffset) {
	int localVariable;
	mutex_lock(&fileMutex);
	errCode = 0;
	currentPID = current->pid;
	currProcessNode = ProcessGetNode(currentPID);
	if (currProcessNode == NULL) {
		printk(KERN_ALERT "ProcessFileWrite: Process %d not found\n", currentPID);
		errCode = -EINVAL;
		goto ProcessFileWriteExit;
	}
	if (userBuffer == NULL || size == 0 || size > MAX_BUFFER_LEN) {
		printk(KERN_ALERT "ProcessFileWrite: Improper Size of Query\n");
		errCode = -EACCES;
		goto ProcessFileWriteExit;
	}
	// Try to add into the queue if possible
	if (copy_from_user(buffer, userBuffer, size)) {
		printk(KERN_ALERT "ProcessFileWrite: Unable to copy from user\n");
		errCode = -EACCES;
		goto ProcessFileWriteExit;
	}

	if (currProcessNode->processState == PROC_INIT) { // Read one byte
		if (size > 1) {
			printk(KERN_ALERT "ProcessFileWrite: Need 1 byte for setting max Deque size\n");
			errCode = -EINVAL;
			goto ProcessFileWriteExit;
		}
		if ((int)buffer[0] < DEQUE_MIN_VALUE || (int)buffer[0] > DEQUE_MAX_VALUE) {
			printk(KERN_ALERT "ProcessFileWrite: Need 1 byte for setting max Deque size\n");
			errCode = -EINVAL;
			goto ProcessFileWriteExit;
		}
		// Initialize deque for process
		currProcessNode->processDeque = DequeCreateDeque((int)buffer[0]);
		currProcessNode->processState = PROC_WRITING;
		printk(KERN_INFO "ProcessFileWrite: Initialized queue (MAX SIZE = %d)\n", (int)buffer[0]);
	}
	else {
		if (size != sizeof(int)) {
			printk(KERN_ALERT "ProcessFileWrite: Only 4 byte integers can be written\n");
			errCode = -EINVAL;
			goto ProcessFileWriteExit;
		}
		// Add to process dequeue
		printk(KERN_INFO "%d ProcessFileWrite: Inserting %d\n", currentPID, *(int *)buffer);
		errCode = DequeInsertIntoDeque(currProcessNode->processDeque, *(int *)buffer);
	}	


ProcessFileWriteExit:
	localVariable = errCode;
	mutex_unlock(&fileMutex);
	return localVariable;
}

/* Process releases its file */
int ProcessFileRelease(struct inode *node, struct file *file) {
	int localVariable;
	mutex_lock(&fileMutex);
	errCode = 0;
	currentPID = current->pid;
	currProcessNode = allProcesses[currentPID & (PROCESS_HT_SIZE - 1)];
	prevProcessNode = NULL;

	// Try to traverse the hash map and fine this process
	while (currProcessNode != NULL) {
		if (currProcessNode->pid == currentPID) break;
		prevProcessNode = currProcessNode;
		currProcessNode = currProcessNode->nextProcess;
	}
	if (currProcessNode == NULL) {
		// Process not found
		printk(KERN_ALERT "ProcessFileRelease: Process %d not found\n", currentPID);
		errCode = -EINVAL;
		goto ProcessFileReleaseExit;
	}
	if (prevProcessNode == NULL) allProcesses[currentPID & (PROCESS_HT_SIZE - 1)] = currProcessNode->nextProcess;
	else prevProcessNode->nextProcess = currProcessNode->nextProcess;
	numProcesses--;
	ProcessFreeNode(currProcessNode);

ProcessFileReleaseExit:
	localVariable = errCode;
	mutex_unlock(&fileMutex);
	return localVariable;
}


/* --------------------- DEQUE FUNCTIONS --------------------------------------------- */
struct Deque *DequeCreateDeque(int dequeCapacity) {
	struct Deque *newDequeue = (struct Deque*)kmalloc(sizeof(struct Deque), GFP_KERNEL);
	if (newDequeue == NULL) {
		printk(KERN_ALERT "DequeCreateDeque: Unable to allocate space for deque\n");
		errCode = -ENOENT;
		return NULL;
	}	
	newDequeue->maxSize = dequeCapacity;
	newDequeue->size = 0;
	newDequeue->left = 0;
	newDequeue->right = 0;
	newDequeue->data = (int *)kmalloc(sizeof(int) * dequeCapacity, GFP_KERNEL);
	for (loopIter = 0; loopIter < dequeCapacity; loopIter++) newDequeue->data[loopIter] = 0;
	if (newDequeue->data == NULL) {
		printk(KERN_ALERT "DequeCreateDeque: Unable to allocate space for deque\n");
		errCode = -ENOENT;
		return NULL;
	}
	return newDequeue;
}

void DequePrintDeque(struct Deque *deque) {
	if (deque == NULL) {
		printk(KERN_ALERT "Deque is null\n");
	}
	loopIter = deque->left;
	do {
		printk(KERN_INFO "%d ", deque->data[loopIter]);
		loopIter = (loopIter + 1) % deque->maxSize;
	}while (loopIter != deque->right);
	printk(KERN_INFO "\n");
}	

int DequeInsertIntoDeque(struct Deque *deque, int data) {
	if (deque->size == deque->maxSize) {
		printk(KERN_ALERT "DequeInsertIntoDeque: Deque is full\n");
		return -EACCES;
	}
	if (data % 2 == 0) { // Insert into right (even)
		deque->data[deque->right] = data;
		deque->right = (deque->right + 1) % deque->maxSize;
	}
	else {	// Insert into left (odd)
		deque->left = (deque->left - 1 + deque->maxSize) % deque->maxSize;
		deque->data[deque->left] = data;
	}
	// DequePrintDeque(deque);
	deque->size++;
	return (int)sizeof(int);
}

int DequeDeleteFromDeque(struct Deque *deque, int *data) {
	if (deque->size == 0) {
		printk(KERN_ALERT "DequeDeleteFromDeque: Deque is empty\n");
		return -EACCES;
	}
	*data = deque->data[deque->left];
	deque->left = (deque->left + 1) % deque->maxSize;
	deque->size--;
	return (int)sizeof(int);
	// DequePrintDeque(deque);	
};

void DequeFreeDeque(struct Deque *deque) {
	if (deque == NULL) return;
	if (deque->data != NULL) kfree(deque->data);
	kfree(deque);
}



module_init(DequeLKMInit);
module_exit(DequeLKMExit);



