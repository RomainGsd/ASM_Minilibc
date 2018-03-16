section .bss
	digit resb 100 	; resb = reserve byte
	digitSpacePos resb 8

section .text
global _start

%macro printInt 1
	mov rax, %1
	call _printInteger
%endmacro

%macro exit 1
	mov rax, 60
	mov rdi, %1
	syscall
%endmacro

_start:
	printInt 123
	exit 0

_printInteger:
	mov rcx, digit
	mov rbx, 10
	mov [rcx], rbx
	inc rcx
	mov [digitSpacePos], rcx

_printIntegerLoop:
	mov rdx, 0
	mov rbx, 10
	div rbx
	push rax
	add rdx, 48

	mov rcx, [digitSpacePos]
	mov [rcx], dl
	inc rcx
	mov [digitSpacePos], rcx

	pop rax
	cmp rax, 0
	jne _printIntegerLoop

_printIntegerLoop2:
	mov rcx, [digitSpacePos]

	mov rax, 1
	mov rdi, 1
	mov rsi, rcx
	mov rdx, 1
	syscall

	mov rcx, [digitSpacePos]
	dec rcx
	mov [digitSpacePos], rcx

	cmp rcx, digit
	jge _printIntegerLoop2

	ret
