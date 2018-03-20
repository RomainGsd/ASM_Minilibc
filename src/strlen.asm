[BITS 64]

section .text
global strlen 			; size_t strlen(char const *)

strlen:
	push rbp
	mov rbp, rsp 		; save stack

	xor rax, rax		; set rcx to 0

strlenloop:
	cmp byte [rdi + rax], 0	; 
	jz exit			; goto end if [rdi + rax] == byte NULL
	inc rax
	jmp strlenloop

exit:
	mov rcx, rax

	mov rsp, rbp
	pop rbp
	ret
