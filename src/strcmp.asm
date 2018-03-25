[bits 64]

	; int strcmp(const char *str1, const char *str2)
	
section .text
global strcmp

strcmp:
	push rbp
        mov rbp, rsp

	xor rcx, rcx
	
strcmpLoop:
	mov r10b, [rdi + rcx]
	mov r8b, [rsi + rcx]
	cmp r10b, byte 0
	je exit
	cmp r8b, byte 0
	je exit
	cmp r10b, r8b
	jne exit
	inc rcx
	jmp strcmpLoop

exit:
	sub r10b, r8b 		; diff to return
	movsx rax, r10b		; movsx to put 8bit register into 64 bit register
	
	mov rsp, rbp
        pop rbp
        ret
