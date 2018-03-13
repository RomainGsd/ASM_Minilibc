section .text
global _start, _strlen

_strlen:
	push rbp
	xor rbp, rsp 		; Initialize and save stack

	mov rbx, [rbp+8]	; first argument
	xor rax, rax		; length

_strlen_next:
;; Receive arg and compare to null byte
	cmp byte [rbx], byte 0
	jz _strlen_null	      ; If null byte reached, goto strlen_null

;; While != null byte increment variable
	inc rax			; length += 1
	inc rbx			;
	jmp _strlen_next 	; recursive call

_strlen_null:
	pop rbp
	ret

_start:
	push qword [rsi+r8] 	; push av[1]
	call _strlen
	add rsp, 4 		; remove argument from stack

	mov rbx, rax
	mov rax, 1
	syscall
