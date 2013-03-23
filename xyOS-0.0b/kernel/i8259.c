#include"../include/type.h"
#include"i8259.h"

extern void intr_handler (int irq_num);

void init_8259A (void)
{
	int i;
	for (i = 0; i < 16; i ++)
		irq_table[i] = intr_handler;

	outb (0xff, PIC_MASTER_IMR);
	outb (0xff, PIC_SLAVE_IMR);

	outb_pic (0x11,	PIC_MASTER_CMR); /*主片ICW1*/
	outb_pic (0x11, PIC_SLAVE_CMR);  /*从片ICW1*/

	outb_pic (IRQ0_VECTOR, PIC_MASTER_IMR); /*IRQ0对应中断向量48*/
	outb_pic (IRQ8_VECTOR, PIC_SLAVE_IMR); /*IRQ8对应中断向量56*/

	outb_pic (0x4, PIC_MASTER_IMR);/*主片IR2对应从片*/
	outb_pic (0x2, PIC_SLAVE_IMR); /*从片对应主片IR2*/

	outb_pic (0x1, PIC_MASTER_IMR); /*x86模式，非自动发送EOI信号*/
	outb_pic (0x1, PIC_SLAVE_IMR);	/*同上*/
}

void op_8259A (int M_OPW, int S_OPW)
{
	outb_pic (M_OPW, PIC_MASTER_IMR);
	outb_pic (S_OPW, PIC_SLAVE_IMR);
}

