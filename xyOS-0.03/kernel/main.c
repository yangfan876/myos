#include "../lib/printk.h"
#include "i8259.h"

void __init__ (void)
{
	change_gdt ();
	printk ("we have changed the gdt!\n");
	init_8259A ();
	printk ("8259A has been inited!\n");
}
