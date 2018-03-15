section .text
global _strlen

_strlen:
	push rax
	mov rbx, 0
	call _strlen_next
	ret
	
_strlen_next:
	inc rax
	inc rbx
	mov cl, [rax]
	cmp cl, 0
	jne _strlen_next
	ret
