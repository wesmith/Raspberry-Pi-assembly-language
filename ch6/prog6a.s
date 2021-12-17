/* prog6a.s from Bruce Smith book,
	WS 12/17/21
	perform R0 = R1 + R2*/

	.global _start

_start:

	mov R1, #50
	mov R2, #60
	adds R0, R1, R2  @ compiler didn't like a space before 's'

	mov R7, #1   @ exit through syscall
	swi 0
	
	
