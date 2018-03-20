[bits 64]

	; int strcmp(const char *str1, const char *str2)
	
section .text
global strcmp

strcmp:
	push rbp
        mov rbp, rsp

	xor rcx, rcx
	
strcmpLoop:
	

exit:
	mov rsp, rbp
        pop rbp
        ret
