#include<stdio.h>
#include"../lib/printk.h"
/*每隔一段时间打印一个‘A’*/
void testA (void)			
{
	int i;
	for (i = 0; i < 10; i++)
	{
		printk ("A");
		wait (1);
	}
	for (;;);
}
/*相隔一段时间打印一个'B'*/
void testB (void)
{
	int i;
	for (i = 0; i < 10; i++)
	{
		printk ("B");
		wait (2);
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
