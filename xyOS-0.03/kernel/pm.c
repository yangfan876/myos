#include"../include/type.h"
#include"../include/protect.h"
#include"pm.h"

/*切换GDT表*/
void change_gdt (void)
{
	init_seg_des (0, 0, 0, 0);	/*intel规定GDT中第一条表项为全0*/
	init_seg_des (SEG_BASE, SEG_LIMIT,\
			SEG_DES_DPL0 | SEG_DES_32 | SEG_DES_G | SEG_DES_S | SEG_DES_CR | SEG_DES_P, GDT_ENTRY_KERNEL_CS);
	init_seg_des (SEG_BASE, SEG_LIMIT,\
			SEG_DES_DPL0 | SEG_DES_32 | SEG_DES_G | SEG_DES_S | SEG_DES_DWA | SEG_DES_P, GDT_ENTRY_KERNEL_DS);

	u16 *GDT_LIMIT = (u16 *) (&gdt_ptr[0]);
	u32 *GDT_BASE = (u32 *) (&gdt_ptr[2]);
	*GDT_LIMIT = (sizeof (SEGMENT_DES) * GDT_SIZE - 1);
	*GDT_BASE = (u32) &GDT;
	jump_new_gdt ();/*跳入新的GDT表中*/
}
