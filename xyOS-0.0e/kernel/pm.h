#include "../include/type.h"
void change_gdt (void);

static int init_segment (u32 base, u32 limit, u16 attr, int entry);

void init_idt (void);
