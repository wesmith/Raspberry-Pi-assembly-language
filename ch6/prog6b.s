/* prog6b.s from Bruce Smith book,
	WS 12/17/21
	add two 64-bit numbers together */

	.global _start

_start:

	mov  R2, #0xFFFFFFFF 	  @ low half number 1
	mov  R3, #0x1        	  @ hi  half number 1
	mov  R4, #0xFFFFFFFF 	  @ low half number 2
	mov  R5, #0xFF    	  @ hi  half number 2
	adds R0, R2, R4  	@ add low and set flags
	adcs R1, R3, R5		@ add hi with carry
	mov  R7, #1   		@ exit through syscall
	swi  0
