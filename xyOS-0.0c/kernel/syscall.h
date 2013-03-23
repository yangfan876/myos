#include "../include/type.h"

#define NR_SYSCALL	2

u32 *syscall_table[NR_SYSCALL];

int syscall_handler (int syscall_num);
void init_syscall (void);

