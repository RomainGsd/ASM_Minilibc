section .data
	digit db 48, 10

section .text
global _start

_start:
	call _PrintNumber
	push 4
	push 8
	push 3

	pop rax
	call _PrintNumber
	pop rax
	call _PrintNumber
	pop rax
	call _PrintNumber

	mov rax, 60
	mov rdi, 0
	syscall

_PrintNumber:
	add rax, 48
	mov [digit], al

	mov rax, 1
	mov rdi, 1
	mov rsi, digit
	mov rdx, 3
	syscall
	ret
