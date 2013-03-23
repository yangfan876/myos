#include<stdio.h>
#include"../lib/printk.h"

void testA (void)
{
	int i;
	for (i = 0; i < 10; i++)
		printk ("ABC");
	for (;;);
}
