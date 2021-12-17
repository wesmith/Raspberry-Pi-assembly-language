/* prog6c.s from Bruce Smith book,
	WS 12/17/21
	multiply two numbers together */

	.global _start

_start:
	mov r1, #20
	mov r2, #5
	mul r0, r1, r2
	
	mov r7, #1
	swi 0

