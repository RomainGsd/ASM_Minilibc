[BITS 64]

section .text
global strlen 			; size_t strlen(char const *)

strlen:
	push rbp
	mov rbp, rsp 		; get arguments passed by c function

	xor rcx, rcx

strlenloop:
	cmp BYTE [rdi + rcx], 0
	jz end
	inc rcx
	jmp strlenloop

end:
	mov rax, rcx

	mov rsp, rbp
	pop rbp
	ret
