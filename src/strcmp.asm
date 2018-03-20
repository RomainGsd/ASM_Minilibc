[bits 64]

section .text
global strcmp

strcmp:
	push rbp
        mov rbp, rsp

strcmpLoop:
	
exit:
	mov rsp, rbp
        pop rbp
        ret

