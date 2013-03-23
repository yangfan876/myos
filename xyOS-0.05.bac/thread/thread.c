#include "../include/global.h"
#include "thread.h"
#include "../test/testA.c"
#include "../include/list.h"

static struct list all_list;
static struct list ready_list;

int __KERNEL_CS = 0x60;
int __KERNEL_DS = 0x68;

/*线程描述符*/
struct task_struct
{
	struct thread_PCB regs;
	int tid;
	char name[20];
	int priority;
	struct list_head in_all_list;
	struct list_head elem;	
	char thread_stack [THREAD_STACK_SIZE];
};

u32 *tmp_esp;

void init_first_thread (void)
{

	struct task_struct testthread;
	testthread.regs.cs = __KERNEL_CS;
	testthread.regs.gs = __KERNEL_DS;
	testthread.regs.fs = __KERNEL_DS;
	testthread.regs.es = __KERNEL_DS;
	testthread.regs.ds = __KERNEL_DS;
	testthread.regs.ss = __KERNEL_DS;

	testthread.regs.eip = (u32) testA;
	testthread.regs.esp = (u32) &testthread.thread_stack + THREAD_STACK_SIZE;   
	testthread.regs.eflags = 0x1202;
//	insert_list_by_pri (&testthread.elem, &ready_list);
	tmp_esp = (u32 *) &testthread;
}

/*根据线程优先级从小到大添加到链表中*/
int insert_list_by_pri (struct list_head *elem, struct list *list )
{
	struct list_head *p;
	if (list_empty(list))
		list_insert_next (&list->head, elem);
	p = list->head.next;
	do{
		if(list_entry(elem, struct task_struct, elem)->priority <= \
				list_entry(p, struct task_struct, elem)->priority)

			list_insert_prev (elem, p);
		p = p->next;
	}while (p != &list->tail);
	return 1;
}
