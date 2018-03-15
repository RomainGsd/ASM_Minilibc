	STDOUT equ 1
	SYS_WRITE equ 1
	SYS_EXIT equ 60

section .data
	digit db 0, 10

section .text
global _start

%macro exit 1
	mov rax, SYS_EXIT
	mov rdi, %1
	syscall
%endmacro

%macro printDigit 1
	mov rax, %1
	call _PrintDigit
%endmacro

_start:
	printDigit 1
	printDigit 3
	
	exit 0

_PrintDigit:
	add rax, 48
	mov [digit], al

	mov rax, SYS_WRITE
	mov rdi, STDOUT
	mov rsi, digit
	mov rdx, 2
	syscall
	ret
