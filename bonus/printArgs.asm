%include "debug.inc"

section .data
	args_nb db "Argument(s) : ", 0
	args db "Argument #", 0
	dot db " : ", 0
	newline db 10, 0

section .bss
	argc resb 8
	argPos resb 8
	
section .text
global _start

_start:
	mov rax, 0
	mov [argPos], rax
	pop rax
	mov [argc], rax
	print args_nb
	printInteger [argc]
	print newline
	
_argsLoop:
	mov rax, [argPos]
	inc rax
	mov [argPos], rax
	
	print args
	printInteger [argPos]
	print dot
	pop rax
	print rax
	print newline

	mov rax, [argPos]
	mov rbx, [argc]
	cmp rax, rbx
	jne _argsLoop
	
	exit 0
