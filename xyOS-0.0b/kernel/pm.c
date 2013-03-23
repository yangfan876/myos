#include "../include/type.h"
#include "../include/protect.h"
#include "pm.h"

/*初始化新的GDT，并且切换*/
void change_gdt (void)
{
	/*初始化GDT*/

	/*初始化内核，用户的代码段及数据段*/
	init_seg_des (0, 0, 0, 0);	/*intel规定GDT中第一条表项为全0*/
	init_seg_des (SEG_BASE, SEG_LIMIT,\
			DPL0 | SEG_DES_32 | SEG_DES_G | SEG_DES_S | SEG_DES_CR | SEG_DES_P, GDT_ENTRY_KERNEL_CS);
	init_seg_des (SEG_BASE, SEG_LIMIT,\
			DPL0 | SEG_DES_32 | SEG_DES_G | SEG_DES_S | SEG_DES_DWA | SEG_DES_P, GDT_ENTRY_KERNEL_DS);
	init_seg_des (SEG_BASE, SEG_LIMIT,\
			DPL3 | SEG_DES_32 | SEG_DES_G | SEG_DES_S | SEG_DES_CR | SEG_DES_P, GDT_ENTRY_USER_CS);
	init_seg_des (SEG_BASE, SEG_LIMIT,\
			DPL3 | SEG_DES_32 | SEG_DES_G | SEG_DES_S | SEG_DES_DWA | SEG_DES_P, GDT_ENTRY_USER_DS);
	init_seg_des (SEG_BASE, SEG_LIMIT,\
			DPL3 | SEG_DES_32 | SEG_DES_G | SEG_DES_S | SEG_DES_DWA | SEG_DES_P, GDT_ENTRY_USER_DS);

	/*初始化TSS段*/
	TSS.ss0 = __KERNEL_DS;
	TSS.iobase =  sizeof (TSS);
	init_seg_des ((u32) &TSS, TSS_SIZE - 1, DA_386TSS, GDT_ENTRY_TSS);
	

	u16 *GDT_LIMIT = (u16 *) (&gdt_ptr[0]);
	u32 *GDT_BASE = (u32 *) (&gdt_ptr[2]);
	*GDT_LIMIT = (sizeof (SEGMENT_DES) * GDT_SIZE - 1);
	*GDT_BASE = (u32) &GDT;
	jump_new_gdt ();/*跳入新的GDT表中*/
}

/*初始化IDT，并加载*/
void init_idt(void) 						
{	
	/*初始化中断门描述符*/
	init_idt_des ((u32) divide_error, DPL0,\
			IDT_INT, VECTOR_DIVIDE_ERROR);
	init_idt_des ((u32) debug, DPL0,\
			IDT_INT, VECTOR_DEBUG);
	init_idt_des ((u32) nmi, DPL0, IDT_INT, VECTOR_NMI);
	init_idt_des ((u32) int3, DPL0, IDT_INT, VECTOR_INT3);
	init_idt_des ((u32) overflow, DPL0,\
			IDT_INT,VECTOR_OVERFLOW );
	init_idt_des ((u32) bounds, DPL0,\
			IDT_INT, VECTOR_BOUNDS);
	init_idt_des ((u32) invalid_op, DPL0,\
			IDT_INT, VECTOR_INVALID_OP);
	init_idt_des ((u32) device_not_available, DPL0,\
			IDT_INT, VECTOR_DEVICE_NOT_AVAILABLE);
	init_idt_des ((u32) doublefault_fn, DPL0,\
			IDT_INT, VECTOR_DOUBLEFAULT_FN);
	init_idt_des ((u32) coprocessor_segment_overrun, DPL0,\
			IDT_INT, VECTOR_COPROCESSOR_SEGMENT_OVERRUN);
	init_idt_des ((u32) invalid_tss, DPL0,\
			IDT_INT, VECTOR_INVALID_TSS);
	init_idt_des ((u32) segment_not_present, DPL0,\
			IDT_INT, VECTOR_SEGMENT_NOT_PRESENT);
	init_idt_des ((u32) stack_segment, DPL0,\
			IDT_INT, VECTOR_STACK_SEGMENT);
	init_idt_des ((u32) general_protection, DPL0,\
			IDT_INT, VECTOR_GENERAL_PROTECTION);
	init_idt_des ((u32) page_fault, DPL0,\
			IDT_INT, VECTOR_PAGE_FAULT);
	init_idt_des ((u32) coprocessor_error, DPL0,\
			IDT_INT, VECTOR_COPROCESSOR_ERROR);

	/*初始化异常描述符*/
	init_idt_des ((u32) hwint00, DPL0, IDT_INT, IRQ0_VECTOR);
	init_idt_des ((u32) hwint01, DPL0, IDT_INT, IRQ1_VECTOR);
	init_idt_des ((u32) hwint02, DPL0, IDT_INT, IRQ2_VECTOR);
	init_idt_des ((u32) hwint03, DPL0, IDT_INT, IRQ3_VECTOR);
	init_idt_des ((u32) hwint04, DPL0, IDT_INT, IRQ4_VECTOR);
	init_idt_des ((u32) hwint05, DPL0, IDT_INT, IRQ5_VECTOR);
	init_idt_des ((u32) hwint06, DPL0, IDT_INT, IRQ6_VECTOR);
	init_idt_des ((u32) hwint07, DPL0, IDT_INT, IRQ7_VECTOR);
	init_idt_des ((u32) hwint08, DPL0, IDT_INT, IRQ8_VECTOR);
	init_idt_des ((u32) hwint09, DPL0, IDT_INT, IRQ9_VECTOR);
	init_idt_des ((u32) hwint10, DPL0, IDT_INT, IRQ10_VECTOR);
	init_idt_des ((u32) hwint11, DPL0, IDT_INT, IRQ11_VECTOR);
	init_idt_des ((u32) hwint12, DPL0, IDT_INT, IRQ12_VECTOR);
	init_idt_des ((u32) hwint13, DPL0, IDT_INT, IRQ13_VECTOR);
	init_idt_des ((u32) hwint14, DPL0, IDT_INT, IRQ14_VECTOR);
	init_idt_des ((u32) hwint15, DPL0, IDT_INT, IRQ15_VECTOR);

	/*初始化idt base及limit,并加在到idtr寄存器*/
	u16 *idt_limit = (u16 *) (&idt_ptr[0]);		
	u32 *idt_base = (u32 *) (&idt_ptr[2]);		
	*idt_limit = IDT_SIZE * sizeof (GATE) - 1;	
	*idt_base = (u32) &IDT;
	load_idt ();
}


