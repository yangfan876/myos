#include "../include/type.h"
#include "i8259.h"
#include "keyboard.h"
#include "keymap.h"

extern void keyboard_interrupt(int irq);

KB_INPUT kb_in;

void init_keybord (void)
{
	kb_in.count = 0;
	kb_in.p_head = kb_in.p_tail = kb_in.buf;
	set_irq_handler (KEYBORD_INTR, keyboard_interrupt);
}

void keyboard_read (void)
{
	u8	scan_code;
	char	output[2] = {0, 0};
	int	make;	/* TRUE: make;  FALSE: break. */


	if(kb_in.count > 0){
		//disable_int();
		scan_code = *(kb_in.p_tail);
		kb_in.p_tail++;
		if (kb_in.p_tail == kb_in.buf + KB_IN_BYTES) {
			kb_in.p_tail = kb_in.buf;
		}
		kb_in.count--;
		//enable_int();

		/* 下面开始解析扫描码 */
		if (scan_code == 0xE1) {
			/* 暂时不做任何操作 */
		}
		else if (scan_code == 0xE0) {
			/* 暂时不做任何操作 */
		}
		else {	/* 下面处理可打印字符 */

			/* 首先判断Make Code 还是 Break Code */
			make = (scan_code & FLAG_BREAK ? FALSE : TRUE);

			/* 如果是Make Code 就打印，是 Break Code 则不做处理 */
			if(make) {
				output[0] = keymap[(scan_code&0x7F)*MAP_COLS];
				disp_str(output);
			}
		}
		/* disp_int(scan_code); */
	}

}
