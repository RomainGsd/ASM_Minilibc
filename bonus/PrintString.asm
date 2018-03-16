section .data
	text db "Hello, World!", 10,0
	text2 db "World?",10,0
	
section .text
global _start

%macro printString 1
	mov rax, %1
	call _print
%endmacro
	
%macro exit 1
	mov rax, 60
	mov rdi, %1
	syscall
%endmacro
	
_start:
	printString text
	printString text2

	exit 0
	;input: rax as pointer to string
	;output: print string at rax
_print:
	push rax
	mov rbx, 0

_printLoop:
	inc rax
	inc rbx
	mov cl, [rax]
	cmp cl, 0
	jne _printLoop

	mov rax, 1
	mov rdi, 1
	pop rsi
	mov rdx, rbx
	syscall
	ret
