[bits 64]
	; void *memset(void *str, int c, size_t n)
	; rdi : block of memory to fill
	; rsi : value to be set
	; rdx : number of byte to be set to the value

section .text
global memset

memset:
	push rbp
	mov rbp, rsp

	mov rcx, 0
	dec rdx
	
setBytes:
	mov byte [rdi + rcx], sil
	cmp rcx, rdx
	je exit
	inc rcx
	jmp setBytes

exit:
	mov rsp, rbp
	pop rbp
	ret
	
