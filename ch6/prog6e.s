/* prog6e.s from Bruce Smith book,
	WS 12/17/21
	signed division (RPi 2 and greater) */

	.global _start

_start:

	mov r3, #31 	@ numerator
	mov r4, #5	@ denominator
	sdiv r0, r3, r4

	mov r7, #1
	swi 0
	
