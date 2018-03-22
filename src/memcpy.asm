[bits 64]

section .text
global memcpy

memcpy:
	push rbp
	mov rbp, rsp

	xor rcx, rcx

memcpyLoop:
	cmp rdx, rcx
	jz exit
	mov r10b, [rsi + rcx]
	mov [rdi + rcx], r10b
	inc rcx
	jmp memcpyLoop

exit:
	mov rax, rdi

	mov rsp, rbp
	pop rbp
	ret
