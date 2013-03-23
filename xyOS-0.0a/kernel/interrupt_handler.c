#include "../include/global.h"

int timer_interrupt (void)
{
	if (k_reentry != 0)
		printk ("!");
	printk (".");
	if (current_thread_ticks() % 5 < 4)
	{
		current_thread_ticks_inc();
		return 1;
	}
	else
	{
		current_thread_ticks_inc ();
		ready_thread = next_thread_to_run ();
		return 1;
	}
}
