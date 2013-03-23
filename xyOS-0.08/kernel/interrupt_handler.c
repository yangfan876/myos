#include "../include/global.h"

void timer_interrupt (void)
{
	printk (".");	
	ready_thread = next_thread_to_run ();
}
