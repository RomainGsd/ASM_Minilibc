[bits 64]
	; char *strcpy(char *dest, const char *src)

section .text
global strcpy

strcpy:
        push rbp
        mov rbp, rsp

	xor rcx, rcx
	xor rdx, rdx

countDestLength:
	cmp byte [rdi + rcx], 0
	je copyBytes
	inc rcx
	jmp countDestLength

copyBytes:
	mov dil, byte [rsi + rdx]
	cmp rdx, rcx
	je exit
	inc rdx
	jmp copyBytes

exit:
        mov rsp, rbp
        pop rbp
        ret
