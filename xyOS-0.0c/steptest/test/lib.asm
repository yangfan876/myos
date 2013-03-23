[section .text]

global system_call


system_call:
	mov eax, [esp + 4]
	int 0x80
	ret
