#include "../include/type.h"

#define THREAD_STACK_SIZE	0x8000

void init_first_thread (void);

struct task_struct;

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
	char thread_stack [THREAD_STACK_SIZE];
};

u32 *ready_thread;
