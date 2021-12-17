/* prog6d.s from Bruce Smith book,
	WS 12/17/21
	multiply two numbers together with accumulation */

	.global _start

_start:
	mov r1, #20
	mov r2, #5
	mov r3, #10
	mla r0, r1, r2, r3 @ r0 = (r1 * r2) + r3
	
	mov r7, #1
	swi 0
