#define THREAD_STACK_SIZE	0x8000		/*线程栈大小*/
#define THREAD_ALIGN	0x1000			/*线程地址按照4k大小对齐*/
#define THREAD_ADD_MASK 	~(0x1000-1)	/*线程地址掩码*/

int __USER_CS = 0x73;
int __USER_DS = 0x7b;

/*用于保存线程的现场信息*/
struct thread_PCB 
{
	u32	gs;
	u32	fs;
	u32	es;
	u32	ds;
	u32	edi;
	u32 esi;
	u32 ebp;
	u32 kernel_esp;
	u32 ebx;
	u32 edx;
	u32 ecx;
	u32 eax;
	u32	retaddr;
	u32	eip;
	u32	cs;
	u32 eflags;
	u32 esp;
	u32 ss;
};

/*线程描述符*/
struct task_struct
{
	struct thread_PCB regs;
	int tid;
	char name[20];
	int priority;
	int ticks;
	int status;
	struct list_head elem;
	struct list_head all_elem;
	char thread_stack [THREAD_STACK_SIZE];
} __attribute__((aligned(THREAD_ALIGN)));	/*线程地址安4k对齐*/


