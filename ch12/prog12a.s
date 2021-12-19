/* prog12a.s from Bruce Smith book,
	WS 12/19/21
        long multiplication the 'hard' way, multiply without
	the use of UMULL
NOTE:	at present, this doesn't provide output to check: use GDB to look at registers*/

	@ r1 = unsigned 32-bit number 1
	@ r2 = unsigned 32-bit number 2

	@ on Exit:
	@ r3 = result (low-word  of the product)
	@ r4 = result (high-word of the product)

	.global _start

_start:
	mov r1, #0xF0000002	@
	mov r2, #0x2       	@

_mult:
	movs r4, r1, lsr #16		@ r4 is most-sig  16 bits of r1
	bic  r1, r1, r4, lsl #16	@ r1 is least-sig 16 bits of r1
	mov  r5, r2, lsr #16		@ r5 is most-sig  16 bits of r2 (note: mov instead of movs: why?)
	bic  r2, r2, r5, lsl #16	@ r2 is least-sig 16 bits of r2
	
	mul  r3, r1, r2 		@ low partial product into r3
	mul  r2, r4, r2			@  first mid-partial product into r2
	mul  r1, r5, r1			@ second mid-partial product into r1
	mulne r4, r5, r4 		@ high partial product into r4: note use of flags, defined from first movs?

	adds r1, r1, r2			@ add mid-partials into r1
	addcs r4, r4, #0x10000		@ add carry to high partial (if previous adds set the carry bit)
	adds r3, r3, r1, lsl #16 	@ add mid-partials to low partial (why the shift left?)
	adc  r4, r4, r1, lsr #16	@ sum into high word

	mov r7, #1			@ exit syscall
	swi 0
