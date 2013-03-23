#include "../include/type.h"
#include "timer.h"
#include "i8259.h"

u32 ticks;

extern int timer_interrupt(void);

void init_timer (void)
{
	ticks = 0;
	outb_pic (TIMER_SET, TIMER_MODE);
	outb_pic ((u8) (TIMER_FREQ/HZ), TIMER_COUNTER0);
	outb_pic ((u8) (TIMER_FREQ/HZ) >> 8,TIMER_COUNTER0);
	set_irq_handler (TIMER_INTR, timer_interrupt);
}

void ticks_inc (void)
{
	if (ticks > 65530)
		ticks = 0;
	else
		ticks ++;
}


