#include "../lib/printk.h"
#include "i8259.h"

void __init__ (void)
{
	printk ("loader's work have done, we are in the kernel code now !\n");
	init_8259A ();
	printk ("8259A has been inited!\n");
}
