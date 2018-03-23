[bits 64]

        ; int strncmp(const char *str1, const char *str2, size_t n)

section .text
global strncmp

strncmp:
        push rbp
        mov rbp, rsp

        xor rcx, rcx

strncmpLoop:
	cmp rdx, rcx
	jz exit
        mov r10b, [rdi + rcx]
        mov r8b, [rsi + rcx]
	cmp r10b, 0
        je exit
        cmp r8b, 0
        je exit
        cmp r10b, r8b
        jne exit
        inc rcx

        jmp strncmpLoop

exit:
        sub r10b, r8b           ; diff to return
        movsx rax, r10b		; movsx to put 8bit register into 64 bit register

        mov rsp, rbp
        pop rbp
        ret
