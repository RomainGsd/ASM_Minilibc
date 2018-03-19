[bits 64]

section .text
global memcpy

memcpy:
	push rbp
	mov rbp, rsp

	xor rcx, rcx

memcpyLoop:
	cmp rcx, rdx
	je exit
	mov r10, [rsi + rcx]
	mov [rdi + rcx], r10
	inc rcx
	jmp memcpyLoop

exit:
	mov rsp, rbp
	pop rbp
	ret
