[bits 64]

	; char *rindex(const char *s, int c)

section .text
global rindex

rindex:
	push rbp
	mov rbp, rsp

	xor rcx, rcx

strLen:
	cmp byte [rdi + rcx], 0
	jz rindexLoop
	inc rcx
	jmp strLen
	
rindexLoop:
	cmp [rdi + rcx], sil
	jz retNewStr
	cmp rcx, 0
	jz retNull
	dec rcx
	jmp rindexLoop

retNewStr:
	mov rax, rdi
	add rax, rcx
	jmp exit

retNull:
	mov rax, 0

exit:
	mov rsp, rbp
	pop rbp
	ret
