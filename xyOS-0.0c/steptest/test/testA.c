#include "../lib/printk.h"
#include "../kernel/timer.h"
#include "../kernel/keyboard.h"

extern int system_call (int a);

wait (int time)
{
	int i;
	for (i = 0; i < time * 1000; i ++);

}

/*每隔一段时间打印一个‘A’*/
void testA (void)			
{
	int i;
//	for (i = 0; i < 10; i ++)
//	printk ("A");
	while (1)
	{
//		printk ("A");
		wait (1000);
	//	keyboard_read ();
	}
}
/*相隔一段时间打印一个'B'*/
void testB (void)
{
	int i;
	struct task_struct *t;
	while (1)
	{
		printk ("B");
		wait (1000);
	}
		for (;;);
}
void testC (void)
{
	int i;
	struct task_struct *t;

	while (1)
	{
		printk ("C");
		wait (1000);
	}
		for (;;);
}

extern	KB_INPUT kb_in;




void task_tty ()
{
	while (1)
	{
		keyboard_read ();
	}
}
