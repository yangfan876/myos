[SECTION .text]

extern int_handler
extern exception_handler
extern stack_point
extern tmp_esp
extern P_STACKTOP
extern TSS3_S_SP0
extern TSS
extern StackTop
extern ready_thread
extern k_reentry
extern timer_interrupt


global hwint00
global hwint01
global hwint02
global hwint03
global hwint04
global hwint05
global hwint06
global hwint07
global hwint08
global hwint09
global hwint10
global hwint11
global hwint12
global hwint13
global hwint14
global hwint15

global divide_error
global debug
global nmi
global int3
global overflow
global bounds
global invalid_op
global device_not_available
global doublefault_fn
global coprocessor_segment_overrun
global invalid_tss
global segment_not_present
global stack_segment
global general_protection:
global page_fault
global coprocessor_error

;外部中断
;----------------------------------
%macro	hwint_master	1
		push %1
		call int_handler
		add esp, 4
		hlt
%endmacro
;----------------------------------

ALIGN	16
hwint00:
		sub esp, 4							;保存当前线程信息
		pushad								;	
		push	ds							;
		push	es							;
		push	fs							;
		push	gs							;
				
		inc	byte [gs:0xb8000]
		

		inc	dword [k_reentry] 				;判断是否在执行中断处理函数的时候又发生中断，
		cmp dword [k_reentry], 0			;如果是则跳过，否则执行时钟中断处理函数。
		jne	.re_entry						;

		mov esp, StackTop					;切换内核栈
		sti
		
		call timer_interrupt				;执行时钟中断处理函数

		cli

		mov al, 0x20						;向8259A发送EOI操作字
		out	0x20, al 						;

		mov esp, [ready_thread]				;切换进程栈
		lea		eax, [esp + P_STACKTOP]
		mov		dword [TSS + 4], eax			;[TSS + 4] 表示TSS表中sp0的地址
.re_entry:
		dec	dword [k_reentry]				
		pop		gs
		pop		fs
		pop		es
		pop		ds
		popad
		add	esp, 4
	
		iretd
ALIGN	16
hwint01:
		hwint_master	1	

ALIGN	16
hwint02:
		hwint_master	2

ALIGN	16
hwint03:
		hwint_master	3

ALIGN	16
hwint04:
		hwint_master	4

ALIGN	16
hwint05:
		hwint_master	5

ALIGN	16
hwint06:
		hwint_master	6

ALIGN	16
hwint07:
		hwint_master	7

ALIGN	16
hwint08:
		hwint_master	8

ALIGN	16
hwint09:
		hwint_master	9	

ALIGN	16
hwint10:
		hwint_master	10

ALIGN	16
hwint11:
		hwint_master	11

ALIGN	16
hwint12:
		hwint_master	12

ALIGN	16
hwint13:
		hwint_master	13

ALIGN	16
hwint14:
		hwint_master	14

ALIGN	16
hwint15:
		hwint_master	15

;异常处理

NOERROR_CODE equ 0xFFFFFFFF

divide_error:
	push 	NOERROR_CODE
	push 	0
	jmp exception

debug:
	push 	NOERROR_CODE
	push	1
	jmp	exception

nmi:
	push	NOERROR_CODE
	push	2
	jmp	exception

int3:
	push 	NOERROR_CODE
	push 	3
	jmp exception

overflow:
	push 	NOERROR_CODE
	push 	4
	jmp exception

bounds:
	push 	NOERROR_CODE
	push 	5
	jmp exception

invalid_op:
	push 	NOERROR_CODE
	push 	6
	jmp exception

device_not_available:
	push 	NOERROR_CODE
	push 	7
	jmp exception

doublefault_fn:	
	push 	8	
	jmp exception

coprocessor_segment_overrun:
	push 	NOERROR_CODE
	push 	9
	jmp exception

invalid_tss:
	push 	10
	jmp exception

segment_not_present:
	push 	11
	jmp exception

stack_segment:
	push 	12
	jmp exception

general_protection:
	push 	13	
	jmp exception

page_fault:
	push	14
	jmp	exception

coprocessor_error:
	push	NOERROR_CODE
	push	16
	jmp	exception

exception
	call exception_handler
	add esp, 4*2
	hlt
