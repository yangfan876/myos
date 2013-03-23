#define THREAD_STACK_SIZE	0x8000		/*线程栈大小*/
#define THREAD_ALIGN	0x1000			/*线程地址按照4k大小对齐*/
#define THREAD_ADD_MASK 	~(0x1000-1)	/*线程地址掩码*/

int __USER_CS = 0x73;
int __USER_DS = 0x7b;
