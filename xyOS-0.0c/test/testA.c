#include"../lib/printk.h"

extern int system_call (int a);

/*每隔一段时间打印一个‘A’*/
void testA (void)			
{
	int i;
//	for (i = 0; i < 10; i++)
	
	while (1)
	{
		printk ("A");
		i = system_call (0);
		printk ("%d", i);
		wait (1);
	}
	for (;;);
}
/*相隔一段时间打印一个'B'*/
void testB (void)
{
	int i;
	struct task_struct *t;
//	for (i = 0; i < 3; i++)
	while (1)
	{
		printk ("B");
		wait (1);
	}
		for (;;);
}
void testC (void)
{
	int i;
	struct task_struct *t;

//	for (i = 0; i < 3; i++)
	while (1)
	{
		printk ("C");
		wait (1);
	}
		for (;;);
}
void wait (int time)
{
	int i, j, k;
	for (i = 0; i < time * 3; i ++)
		for (j = 0; j < 5000; j ++)
			for (k = 0; k < 500; k ++)
			{;}
}
