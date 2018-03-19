[BITS 64]

section .text
global strlen 			; size_t strlen(char const *)

strlen:
	push rbp
	mov rbp, rsp 		; get arguments passed by c function

	xor rax, rax		;set rcx to 0

strlenloop:
	cmp byte [rdi + rax], 0	;what does contain rdi ?
	jz end			;goto end if [rdi + rcx] == 0
	inc rax
	jmp strlenloop

end:
	mov rcx, rax

	mov rsp, rbp
	pop rbp
	ret
