[bits 64]

section .data
	input db "Reverse me"
	newline db 10
	
section .bss
	output resb 12

section .text
global _start

_start:
	mov rsi, input
	xor rcx, rcx
	cld
	mov rdi , $ + 15
	call calculateStrLength
	xor rax, rax
	xor rdi, rdi
	jmp reverseStr

calculateStrLength:
	cmp byte [rsi], 0
	je exitRoutine
	lodsb			;load byte from rsi to al and inc rsi
	push rax
	inc rcx
	jmp calculateStrLength

exitRoutine:
	ret
	
reverseStr:
	cmp rcx, 0
	je printResult
	pop rax
	mov [output + rdi], rax
	dec rcx
	inc rdi
	jmp reverseStr

printResult:
	mov rdx, rdi
	mov rax, 1
	mov rdi, 1
	mov rsi, output
	syscall
	jmp printNewline

printNewline:
	mov rax, 1
	mov rdi, 1
	mov rsi, newline
	mov rdx, 1
	syscall
	jmp exit

exit:
	mov rax, 60
	mov rdi, 0	
	
