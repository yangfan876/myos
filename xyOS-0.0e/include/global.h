#include "type.h"

extern int disp_pos;	/*显示指针*/
extern u8 gdt_ptr[6];	/*gdt地址及长度*/
extern u8 idt_ptr[6];	/*idt地址及长度*/
extern struct task_struct *ready_thread;
extern struct task_struct *current;

extern int k_reentry;	/*中断重入判断*/
extern u32 ticks;
