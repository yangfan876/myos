#include "../include/global.h"
#include "../include/type.h"
#include "../lib/string.h"
#include "../test/testA.c"
#include "../lib/list.h"
#include "thread.h"


struct task_struct testthread;		/*第一个线程*/
struct task_struct sec_thread;		/*第二个线程*/
struct task_struct thi_thread;		/*第三个线程*/

struct task_struct *ready_thread;
struct task_struct *current;

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

	thread->ticks = 0;
	thread->priority = priority;

	return 1;
}

/*找出正在运行的线程结构体的首地址*/
struct task_struct * running_thread (void)
{

	return  (struct task_struct *) ((u32 )running_esp & THREAD_ADD_MASK);
}

int current_thread_ticks (void)
{
	return running_thread ()->ticks;
}

void current_thread_ticks_inc (void)
{
	running_thread ()->ticks ++;
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

extern restart_thread ();

void run_first_thread (void)
{
	ready_thread = next_thread_to_run ();
	restart_thread ();
}

