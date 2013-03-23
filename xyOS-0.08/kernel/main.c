#include "i8259.h"

extern int disp_pos;
void __init__ (void)
{
	int i;
	
	change_gdt ();
	disp_pos = 0;
	for (i = 0; i < 80 * 25; i ++) 		/*一个Oooo...的清屏....*/
		printk (" ");
	disp_pos = 0;
	
	printk ("we have changed the gdt!\n");
	init_8259A ();
	printk ("8259A have been inited!\n");
	init_idt ();
	printk ("idt have been inited!\n");
	init_first_thread ();
	printk ("first thread have been inited\n");
	init_second_thread ();
	printk ("second thread have been inited\n");
	printk ("set the timer interrupt open\n");
	op_8259A (0xfe, 0xff);
	
}
