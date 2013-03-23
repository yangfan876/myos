#include "../include/type.h"
#include "../include/global.h"
#include "syscall.h"


u32 sys_get_ticks (void)
{
//	printk ("+");
//	printk ("%d", get_ticks ());
	return ticks;
}

int syscall_handler (int syscall_num)
{
	switch (syscall_num)
	{
		case 0: return sys_get_ticks ();
		default:
				break;
	}
}

/*void init_syscall (void)
{
	int i;
	syscall_table[0] = sys_get_ticks;
}*/

