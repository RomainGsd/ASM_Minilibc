section .bss
	digit resb 100
	digitPos resb 8
	printSpace resb 8

	;System calls
	SYS_READ equ 0
	SYS_WRITE equ 1
	SYS_OPEN equ 2
	SYS_CLOSE equ 3
	SYS_BRK equ 12
	SYS_FORK equ 57
	SYS_EXECVE equ 59
	SYS_EXIT equ 60
	SYS_KILL equ 62
	SYS_MKDIR equ 83
	SYS_RMDIR equ 84
	SYS_REBOOT equ 169
	SYS_TIME equ 201

	;
	STDIN equ 0
	STDOUT equ 1
	STDERR equ 2

	;macro to print a string
%macro print 1
	mov rax, %1
	mov [printSpace], rax
	mov rbx, 0

%%printLoop:
	mov cl, [rax]
	cmp cl, 0
	je %%endprintLoop

	inc rbx
	inc rax
	jmp %%printLoop

%%endprintLoop:
	mov rax, SYS_WRITE
	mov rdi, STDOUT
	mov rsi, [printSpace]
	mov rdx, rbx
	syscall
%endmacro

	;macro to print an integer
%macro printInteger 1
    mov rax, %1
%%printInt:
    mov rcx, digit
    mov [digitPos], rcx

%%printIntLoop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rax
    add rdx, 48

    mov rcx, [digitPos]
    mov [rcx], dl
    inc rcx
    mov [digitPos], rcx

    pop rax
    cmp rax, 0
    jne %%printIntLoop

%%printIntLoop2:
    mov rcx, [digitPos]

    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall

    mov rcx, [digitPos]
    dec rcx
    mov [digitPos], rcx

    cmp rcx, digit
    jge %%printLoop2
%endmacro

%macro exit 1
	mov rax, SYS_EXIT
	mov rdx, %1
	syscall
%endmacro
	
