#include "../include/global.h"
#include "i8259.h"

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

/*中断处理函数*/
void intr_handler (int irq_num)
{
	printk ("Interrupt num is :%d\n", irq_num);
}

extern int disp_pos;
/*异常处理函数*/
void exception_handler (int vec_num, int error_code, int eip, int cs, int eflags)
{
	int i;
	char *exception_msg[] = {"#DE", "#DB", "--", "#BP", "#OF", "#BR", 
		"#UD", "#NM", "#DF", "  ", "#TS", "#NP", "SS", "GP", "#PF",
		"RESERVE", "#MF", "#AC", "#MC", "#XF"};

	disp_pos = 0;
	for (i = 0; i < 80 * 5; i ++)
		printk (" ");
	disp_pos = 0;

	printk ("Exception :%s\n", exception_msg[vec_num]);
	printk ("eip:%d   cs:%d   eflags:%d\n", eip, cs, eflags);
	if (error_code != 0xFFFFFFFF)
	{
		printk ("error code:%d\n", error_code);
	}
}

extern u32 *irq_table[];

int set_irq_handler (int irq, void *handler)
{
	irq_table[irq] = handler;
	enable_irq (TIMER_INTR);
	return 1;
}

int disable_irq (int irq)
{
	u8 mask = (1 << (irq % 8)) | 0xff;
	if (irq < 8)
		outb_pic (mask, PIC_MASTER_IMR);
	else
		outb_pic (mask, PIC_SLAVE_IMR);
	return 1;
}

int enable_irq (int irq)
{
	u8 mask =  ~(1 << (irq % 8)) & 0xff;
	if (irq < 8)
		outb_pic (mask, PIC_MASTER_IMR);
	else
		outb_pic (mask, PIC_SLAVE_IMR);
	return 1;
}
