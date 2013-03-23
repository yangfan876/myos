[SECTION .data]

StackSpace	db 1024 * 2	;/*内核栈大小2k*/
StackTop:				;/*内核栈顶地址*/


[section .text]	; 代码在此

global _start	; 导出 _start
global	P_STACKTOP
global	StackTop
global	In

extern __init__
extern	gdt_ptr
extern	ready_thread
extern TSS
extern restart_thread

_start:	
	mov esp, StackTop
	sgdt [gdt_ptr]
	call __init__
	
	sti

	call restart_thread

	jmp $
