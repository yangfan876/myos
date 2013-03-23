
; 编译链接方法
; [root@XXX XXX]# nasm -f elf kernel.asm -o kernel.o
; [root@XXX XXX]# ld -s -Ttext 0x30400 -o kernel.bin kernel.o
; [root@XXX XXX]# 

[SECTION .bss]

extern __init__
extern	gdt_ptr

StackSpace	resb	2 * 1024
StackTop:

[section .text]	; 代码在此

global _start	; 导出 _start

_start:	; 跳到这里来的时候，我们假设 gs 指向显存
	sgdt [gdt_ptr]
	call __init__
	;int 80h
	sti
	jmp $
