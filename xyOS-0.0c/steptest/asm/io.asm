[SECTION .text]

global outb
global outb_pic
global inb
global inb_pic
global disable_intr
global enable_intr

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


;inb (u8 value)

inb:
	mov edx, [esp + 4]
	xor eax, eax
	in 	al, dx
	ret

inb_pic:
	mov edx, [esp + 4]
	xor eax, eax
	in al, dx
	nop
	nop
	ret


;disable_int ()

disable_intr:
	cli
	ret

;enable_intr ()

enable_intr:
	sti
	ret
