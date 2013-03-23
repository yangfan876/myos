
; 编译链接方法
; [root@XXX XXX]# nasm -f elf kernel.asm -o kernel.o
; [root@XXX XXX]# ld -s -Ttext 0x30400 -o kernel.bin kernel.o
; [root@XXX XXX]# 

extern __init__
extern	gdt_ptr
extern	tmp_esp
[SECTION .data]

StackSpace	db 1024 * 2	;/*内核栈大小2k*/
StackTop:				;/*内核栈顶地址*/

[SECTION .bss]

[section .text]	; 代码在此

global _start	; 导出 _start

_start:	; 跳到这里来的时候，我们假设 gs 指向显存
	mov esp, StackTop
	sgdt [gdt_ptr]
	call __init__
	mov esp, [tmp_esp]
	pop gs
	pop fs
	pop es
	pop ds
	popad
	add esp, 4
	iretd

;	sti
	jmp $
