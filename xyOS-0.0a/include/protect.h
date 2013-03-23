

/*
 *有关GDT的参数，有关段基址和段界限的设置都和linux一样，但是
 *属性设置我是按照自己的方法结合kernel/pm.c中的init_segment
 *函数进行设置。大家可以完成自行设置init_segment函数以及属性
 *参数，但是要根据intel的规定来才行。
 */


/*__KERNEL_CS,__KERNEL_DS,__USER_CS,__USER_DS在gdt中的位置*/
#define GDT_ENTRY_KERNEL_CS	12  
#define GDT_ENTRY_KERNEL_DS	13
#define GDT_ENTRY_USER_CS	14
#define GDT_ENTRY_USER_DS	15



/*选择子*/
#define __KERNEL_CS	(GDT_ENTRY_KERNEL_CS * 8)
#define __KERNEL_DS (GDT_ENTRY_KERNEL_DS * 8)
#define __USER_CS	(GDT_ENTRY_USER_CS * 8 + 3)
#define __USER_DS	(GDT_ENTRY_USER_DS * 8 + 3)

/*关于gdt的一些设置*/
#define	GDT_SIZE	128


/*段描述符属性值设置*/
/*
 *	 11 10 9  8  7  6  5  4  3  2  1  0
 * 	|  |D |  |A |  | D	|  |  		   |
 *	|G |/ |L |V |P | P  |S | T  Y  P  E|
 *	|  |B |  |L |  | L  |  |		   |
 * 
 */
#define	SEG_DES_S 	 	0x10	/*系统段*/
#define	DPL0	 	0x00	/*DPL0*/
#define	DPL3 		0x60	/*DPL3*/
#define SEG_DES_P		0x80	/*段存在于内存*/
#define	SEG_DES_32	 	0x400   /*32位段*/
#define SEG_DES_G		0x800   /*粒度4K*/

/*数据段type值*/
#define	SEG_DES_D	 	0x0		/*Read-Only*/
#define SEG_DES_DA		0x1		/*Read-Only,accessed*/
#define SEG_DES_DW		0x2		/*Read/Write*/
#define	SEG_DES_DWA		0x3		/*Read/Write,accessd*/		
#define	SEG_DES_DE		0x4		/*Read-Only,expand-down*/
#define SEG_DES_DEA		0x5		/*Read-Only,expand-down,accessed*/
#define	SEG_DES_DEW		0x6		/*Read/Write,expand-down*/
#define SEG_DES_DEWA	0x7		/*Read/Write,expand-down,accessed*/

/*代码段type值*/
#define	SEG_DES_C		0x8		/*Execute-Only*/
#define SEG_DES_CA		0x9		/*Execute-Only,accessed*/
#define SEG_DES_CR		0xA		/*Execute/Read*/
#define	SEG_DES_CRA		0xB		/*Execute/Read,accessed*/
#define	SEG_DES_CC		0xC		/*Execute-Only,conforming*/	
#define	SEG_DES_CCA		0xD		/*Execute-Only,conforming,accessed*/
#define	SEG_DES_CCR		0xE		/*Execute/Read,conforming*/
#define	SEG_DES_CCRA	0xF		/*Execute/Read,conforming,accessed*/

/*段机制和段界限*/
#define SEG_BASE	0x0
#define	SEG_LIMIT	0xfffff

/*段描述符*/
typedef struct
{
	u16	limit_low;
	u16	base_low;
	u8	base_mid;
	u8	attr1;
	u8	limit_high_attr2;
	u8	base_high;
}SEGMENT_DES;

/*gdtr值*/
u8 gdt_ptr[6];

/*gdt表*/
SEGMENT_DES GDT[GDT_SIZE] = {0};

/*段描述符初始化*/
#define init_seg_des(base, limit, attr, entry)											\
	do{																					\
		GDT[entry].limit_low = limit & 0xffff;											\
		GDT[entry].base_low = base & 0xffff;											\
		GDT[entry].base_mid = base >> 16 & 0xff;										\
		GDT[entry].attr1 = attr & 0xff;													\
		GDT[entry].limit_high_attr2 = ((attr & 0xf00) >> 4) | ((limit >> 16) & 0xf);	\
		GDT[entry].base_high = base >> 24 & 0xff;										\
	}while(0);



/*下面是关于IDT的一些宏等*/

/*idtr的值*/
u8 idt_ptr[6];
#define IDT_SIZE 256

/*任务门*/
typedef struct 
{
	u16	reserve_low;
	u16	TSS_seg_selec;
	u8	reserve_mid;
	u8	attr;
	u16	reserve_hig;
}TASK_GATE;

/*中断门*/
typedef	struct
{
	u16	offset_low;
	u16	seg_selec;
	u8	reserve_zero;
	u8	attr;
	u16	offset_hig;
}INT_GATE;

/*陷阱门*/
typedef struct
{
	u16	offset_low;
	u16	seg_selec;
	u8	reserve_zero;
	u8	attr;
	u16	offset_hig;
}TRAP_GATE;

typedef INT_GATE GATE;

/*idt表*/
GATE IDT[IDT_SIZE] = {0};

/*描述符类型*/
#define IDT_INT	0x8e
#define IDT_TRAP 0x8f
#define IDT_TASK 0x85

#define init_idt_des(handler, dpl, type, vec)		\
do{													\
	IDT[vec].offset_low = handler & 0xffff;			\
	IDT[vec].seg_selec = __KERNEL_CS & 0xffff;		\
	IDT[vec].reserve_zero = 0;						\
	IDT[vec].attr = (dpl << 5) | type;				\
	IDT[vec].offset_hig = (handler >> 16) & 0xffff;	\
}while(0);

/*中断向量*/
#define IRQ0_VECTOR	0x20
#define IRQ1_VECTOR	0x21
#define IRQ2_VECTOR	0x22
#define IRQ3_VECTOR	0x23
#define IRQ4_VECTOR	0x24
#define IRQ5_VECTOR	0x25
#define IRQ6_VECTOR	0x26
#define IRQ7_VECTOR	0x27
#define IRQ8_VECTOR	0x28
#define IRQ9_VECTOR	0x29
#define IRQ10_VECTOR 0x2a
#define IRQ11_VECTOR 0x2b
#define IRQ12_VECTOR 0x2c
#define IRQ13_VECTOR 0x2d
#define IRQ14_VECTOR 0x2e
#define IRQ15_VECTOR 0x2f

/*异常向量*/
#define	VECTOR_DIVIDE_ERROR		0x0
#define	VECTOR_DEBUG			0x1
#define	VECTOR_NMI				0x2
#define	VECTOR_INT3				0x3
#define	VECTOR_OVERFLOW			0x4
#define	VECTOR_BOUNDS			0x5
#define	VECTOR_INVALID_OP		0x6
#define	VECTOR_DEVICE_NOT_AVAILABLE		0x7
#define	VECTOR_DOUBLEFAULT_FN	0x8
#define	VECTOR_COPROCESSOR_SEGMENT_OVERRUN		0x9
#define	VECTOR_INVALID_TSS		0xA
#define	VECTOR_SEGMENT_NOT_PRESENT	0xB
#define	VECTOR_STACK_SEGMENT	0xC
#define	VECTOR_GENERAL_PROTECTION	0xD
#define	VECTOR_PAGE_FAULT		0xE
#define	VECTOR_COPROCESSOR_ERROR	0x10

/*中断处理函数*/
void hwint00(void);
void hwint01(void);
void hwint02(void);
void hwint03(void);
void hwint04(void);
void hwint05(void);
void hwint06(void);
void hwint07(void);
void hwint08(void);
void hwint09(void);
void hwint10(void);
void hwint11(void);
void hwint12(void);
void hwint13(void);
void hwint14(void);
void hwint15(void);
void hwint16(void);

/*异常处理函数*/
void divide_error (void);
void debug (void);
void nmi (void);
void int3 (void);
void overflow (void);
void bounds (void);
void invalid_op (void);
void device_not_available (void);
void doublefault_fn (void);
void coprocessor_segment_overrun (void);
void invalid_tss (void);
void segment_not_present (void);
void stack_segment (void);
void general_protection (void);
void page_fault (void);
void coprocessor_error (void);

int k_reentry = 0;

/*关于TSS的一些宏等*/
#define GDT_ENTRY_TSS 16		/*TSS在GDT中的索引*/
#define __KERNEL_TSS (GDT_ENTRY_TSS * 8)	/*TSS段选择子*/	

/*TSS定义*/
typedef struct 
{
	u32	backlink;
	u32	esp0;	
	u32	ss0;	
	u32	esp1;
	u32	ss1;
	u32	esp2;
	u32	ss2;
	u32	cr3;
	u32	eip;
	u32	flags;
	u32	eax;
	u32	ecx;
	u32	edx;
	u32	ebx;
	u32	esp;
	u32	ebp;
	u32	esi;
	u32	edi;
	u32	es;
	u32	cs;
	u32	ss;
	u32	ds;
	u32	fs;
	u32	gs;
	u32	ldt;
	u16	trap;
	u16	iobase;
}__TSS;

__TSS	TSS = {0};				/*TSS实体*/

#define TSS_SIZE sizeof(TSS)	/*TSS长度*/

#define DA_386TSS	0x89		/*TSS段属性*/
