[SECTION .text]

global outb
global outb_pic

;outb (u8 value, u16 port)

outb:
	mov eax, [esp + 4]		;value
	mov edx, [esp + 8]		;port
	out dx,	al
	ret

outb_pic:
	mov eax, [esp + 4]		;value
	mov edx, [esp + 8]		;port
	out dx,	al
	nop
	nop
	ret


