#include"../include/type.h"
#include"i8259.h"


void init_8259A (void)
{
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
