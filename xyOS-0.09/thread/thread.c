#include "../include/global.h"
#include "../include/type.h"
#include "../lib/string.h"
#include "../test/testA.c"
#include "../lib/list.h"
#include "thread.h"


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

struct task_struct testthread;		/*第一个线程*/
struct task_struct sec_thread;		/*第二个线程*/
struct task_struct thi_thread;		/*第三个线程*/

struct task_struct *ready_thread;

static struct list all_list;
static struct list ready_list;

int init_first_thread (void)
{
	int i;
	list_init (&all_list);
	list_init (&ready_list);
	
	i = init_thread (&testthread, 4, "testA", (u32 *)testA);
	
	printk ("%d\n", sizeof (testthread));

	list_insert_by_pri (&testthread.elem, &ready_list);		/*将线程1按照优先级插入就绪队列，虽然当前只有一个线程。*/
	list_insert_back (&testthread.all_elem, &all_list);
	return i;
}

int init_second_thread (void)
{
	int i;
	
	i = init_thread (&sec_thread, 3, "testB", (u32 *)testB);

	list_insert_by_pri (&sec_thread.elem, &ready_list);
	list_insert_back (&sec_thread.all_elem, &all_list);
	return i;
}

int init_third_thread (void)
{
	int i;
	
	i = init_thread (&thi_thread, 2, "testC", (u32 *)testC);

	list_insert_by_pri (&thi_thread.elem, &ready_list);
	list_insert_back (&thi_thread.all_elem, &all_list);
	return i;
}

int init_thread (struct task_struct *thread, int priority, const char *name, u32 *function)
{
	thread->regs.cs = __USER_CS;
	thread->regs.gs = __USER_DS;
	thread->regs.fs = __USER_DS;
	thread->regs.es = __USER_DS;
	thread->regs.ds = __USER_DS;
	thread->regs.ss = __USER_DS;

	thread->regs.eip = (u32) function;
	thread->regs.esp = (u32) ((u8 *)&thread->thread_stack + THREAD_STACK_SIZE);   
	thread->regs.eflags = 0x1202;

	strncpy (thread->name, name, 20);

	thread->ticks = 4;
	thread->priority = priority;

	return 1;
}

/*找出正在运行的线程结构体的首地址*/
struct task_struct * running_thread (void)
{
	u32 *esp;

	asm ("mov %%esp, %0": "=g" (esp));		/*嗯？...这是什么！*/

	return  (void *) ((u32 )esp & THREAD_ADD_MASK);
}

struct task_struct * next_thread_to_run (void)
{
	if (list_empty (&ready_list))
	{;}
	else
	{
		struct task_struct *t;
		
		t = list_entry (ready_list.head.next,\
			struct task_struct, elem);
		list_remove (&t->elem);
		list_insert_back (&t->elem, &ready_list);
		return t;
	}
}

/*根据线程优先级从小到大添加到链表中*/
int list_insert_by_pri (struct list_head *elem, struct list *list )
{
	struct list_head *p;
	
	if (list_empty(list))
	{
		list_insert_next (&list->head, elem);
		return 1;
	}
	
	p = list->head.next;
	
	do{
		if(list_entry(elem, struct task_struct, elem)->priority < \
				list_entry(p, struct task_struct, elem)->priority)
		{
			list_insert_prev (elem, p);
			return 1;
		}
		p = p->next;
	}while (p != &list->tail);
	
	list_insert_back (elem, list);

	return 1;
}

void run_first_thread (void)
{
	ready_thread = next_thread_to_run ();
}

