extern __init__
extern	gdt_ptr
extern	ready_thread
extern TSS

global	P_STACKTOP
global	StackTop
global	In

[SECTION .data]

StackSpace	db 1024 * 2	;/*内核栈大小2k*/
StackTop:				;/*内核栈顶地址*/

;/*TSS中的偏移*/
P_STACKBASE	equ	0
GSREG		equ	P_STACKBASE
FSREG		equ	GSREG		+ 4
ESREG		equ	FSREG		+ 4
DSREG		equ	ESREG		+ 4
EDIREG		equ	DSREG		+ 4
ESIREG		equ	EDIREG		+ 4
EBPREG		equ	ESIREG		+ 4
KERNELESPREG	equ	EBPREG		+ 4
EBXREG		equ	KERNELESPREG	+ 4
EDXREG		equ	EBXREG		+ 4
ECXREG		equ	EDXREG		+ 4
EAXREG		equ	ECXREG		+ 4
RETADR		equ	EAXREG		+ 4
EIPREG		equ	RETADR		+ 4
CSREG		equ	EIPREG		+ 4
EFLAGSREG	equ	CSREG		+ 4
ESPREG		equ	EFLAGSREG	+ 4
SSREG		equ	ESPREG		+ 4
P_STACKTOP	equ	SSREG		+ 4
P_LDT_SEL	equ	P_STACKTOP
P_LDT		equ	P_LDT_SEL	+ 4

TSS3_S_SP0	equ	4


[section .text]	; 代码在此

global _start	; 导出 _start

_start:	; 跳到这里来的时候，我们假设 gs 指向显存
	mov esp, StackTop
	sgdt [gdt_ptr]
	call __init__
	
	sti
	
;	mov esp, [ready_thread]
;	lea eax, [esp + P_STACKTOP]
;	mov dword [TSS + TSS3_S_SP0], eax

;	pop gs
;	pop fs
;	pop es
;	pop ds
;	popad
;	add esp, 4
;	iretd
	jmp $
