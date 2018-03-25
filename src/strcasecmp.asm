[bits 64]

section .text
global strcasecmp

strcasecmp:
	push rbp
	mov rbp, rsp
