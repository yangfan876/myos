#include<stdio.h>
#include"../lib/printk.h"

void testA (void)
{
	int i;
	for (i = 0; i < 10; i++)
	{
		printk ("ABC");
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
