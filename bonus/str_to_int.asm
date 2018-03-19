%include "debug.inc"

section .data
	text db "48", 0

section .text
global _start

_start:
	xor rax, rax
	mov rcx, 10
	mov rsi, text

next:
	cmp byte [rsi], 0
	je end
	mov bl, byte [rsi]
	mul rcx
	sub bl, 48
	add rax, rbx
	inc rsi
	jmp next

end:
	printInteger rax
	exit 0
