#include "i8259.h"
#include "../lib/printk.h"

extern int disp_pos;
extern int timer_interrupt(void);

void __init__ (void)
{
	int i;
	
	change_gdt ();
	disp_pos = 0;
	for (i = 0; i < 80 * 25; i ++) 		/*一个Oooo...的清屏....*/
		printk (" ");
	disp_pos = 0;
	init_timer ();	
	printk ("we have changed the gdt!\n");
	init_8259A ();
	op_8259A (0xff, 0xff);
	printk ("8259A have been inited!\n");
	init_idt ();
	printk ("idt have been inited!\n");
	init_first_thread ();
	printk ("first thread have been inited\n");
	init_second_thread ();
	printk ("second thread have been inited\n");
	init_third_thread ();
	printk ("third thread have been inited\n");
	printk ("set the timer interrupt open\n");
	set_irq_handler (TIMER_INTR, timer_interrupt);
	run_first_thread ();
}
