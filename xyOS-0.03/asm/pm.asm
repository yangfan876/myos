[SECTION .text]

extern gdt_ptr
extern print

__KERNEL_CS equ 60h
__KERNEL_DS equ	68h

global jump_new_gdt

jump_new_gdt:
	lgdt	[gdt_ptr]
	jmp __KERNEL_CS:use_new_gdt
	ret

use_new_gdt:
	ret
