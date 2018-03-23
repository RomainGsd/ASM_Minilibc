[bits 64]

	; void *memmove(void *str1, const void *str2, size_t n)

section .text
global memmove

memmove:
	push rbp
	mov rbp, rsp

	xor rcx, rcx

memmoveLoop:
	cmp rdx, rcx
        jz exit
        mov r10b, [rsi + rcx]
        mov [rdi + rcx], r10b
        inc rcx
        jmp memmoveLoop	

exit:
	mov rsp, rbp
	pop rbp
	ret
