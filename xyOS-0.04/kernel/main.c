#include "../lib/printk.h"
#include "i8259.h"
#include "../test/test.c"

void __init__ (void)
{
	change_gdt ();
	printk ("we have changed the gdt!\n");
	init_8259A ();
	printk ("8259A have been inited!\n");
	init_idt ();
	printk ("idt have been inited!\n");
	test_idt ();
}
