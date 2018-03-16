[BITS 64]
	
section .text
global strchr		; char *strchr(const char *, int c)
extern printf
	
strchr:
	push rbp
	mov rbp, rsp

	xor rcx, rcx

	push [rdi+rcx]
	call printf


	mov rsp, rbp
	pop rbp
	ret
