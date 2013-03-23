#include "../include/type.h"

static u32 ticks;

void init_timer (void)
{
	ticks = 0;
}

void ticks_inc (void)
{
	ticks ++;
}

int get_ticks (void)
{
	return ticks;
}
