
[SECTION .data]

__KERNEL_CS equ 60h
__KERNEL_DS equ	68h
__KERNEL_TSS equ 80h


[SECTION .text]

extern gdt_ptr
extern idt_ptr
extern print

global jump_new_gdt
global load_idt

;加载段描述符表并给段寄存器存入新的段选择子，使其能使用新的段。

jump_new_gdt:
	lgdt	[gdt_ptr]
	mov ax,	__KERNEL_DS
	mov	ds,	ax
	mov es,	ax
	mov ss,	ax
	mov fs,	ax
	mov gs, ax
	
	xor eax, eax
	mov ax, __KERNEL_TSS
	ltr ax
	
	jmp __KERNEL_CS:use_new_gdt
	
	ret

;强制跳入新的代码段。

use_new_gdt:
	ret

;加载中断描述符表

load_idt:
	lidt [idt_ptr]
	ret
