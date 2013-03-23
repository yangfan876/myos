#define	PIC_MASTER_IMR 0x21	
#define PIC_SLAVE_IMR 0xa1	

#define PIC_MASTER_CMR 0x20
#define PIC_SLAVE_CMR 0xa0	

#define IRQ0_VECTOR	0x20
#define IRQ8_VECTOR 0x28

void init_8259A (void);		/*初始化8259A中断控制器*/
void op_8259A (int M_OPW, int S_OPW);	/*打开或关闭指定中断*/

