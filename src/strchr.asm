[BITS 64]

section .data
	retempty db "", 0

section .text
global strchr		; char *strchr(const char *, int c)

strchr:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
	
strchrLoop:
	cmp sil, byte 0
	jz retEmpty
	cmp byte [rdi + rcx], sil
	je retVal
	cmp byte [rdi + rcx], 0
	je retNull
	inc rcx
	jmp strchrLoop

retVal:
	mov rax, rdi
	add rax, rcx
	jmp exit

retEmpty:
	mov rax, retempty
	jmp exit

retNull:
	xor rax, rax
	
exit:
	mov rsp, rbp
	pop rbp
	ret
