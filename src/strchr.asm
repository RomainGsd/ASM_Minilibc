[BITS 64]
	
section .text
global strchr		; char *strchr(const char *, int c)
	
strchr:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
	
strchrLoop:
	cmp byte [rdi + rcx], sil
	je end
	cmp byte [rdi + rcx], 0
	je retNull
	inc rcx
	jmp strchrLoop


retNull:
	mov rax, 0
	
end:
	mov rsp, rbp
	pop rbp
	ret

