

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
#define	SEG_DES_DPL0 	0x00	/*DPL0*/
#define	SEG_DES_DPL3 	0x60	/*DPL3*/
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
SEGMENT_DES GDT[GDT_SIZE];

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

