%include "debug.inc"

section .data
	nb equ 123
	
section .text
global _start

_start:
	printInteger nb
	exit 0
