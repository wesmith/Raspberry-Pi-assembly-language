/* prog10a.s from Bruce Smith book,
	WS 12/18/21
        print a number as a binary string more efficiently than prog8b.s */

	.global _start

_start:
	
	mov r6, #-201 		@ test number to convert (positive or negative works)
	mov r10, #1		@ set up single-bit mask
	mov r9, r10, lsl #31	@ initialize mask bit to MSB, save in r9
	ldr r1, =string		@ point r1 to string

_bits:	
	tst r6, r9		@ compare test number to single bit in r9
	moveq r0, #48		@ ascii '0' in r0 if eq
	movne r0, #49		@ ascii '1' in r0 if ne
	str r0, [r1]		@ store '0' or '1' at string location
	mov r8, r6		@ preserve test number (just good practice before a jump?)
	bl _write		@ write '0' or '1' to screen
	mov r6, r8		@ retrieve test number
	movs r9, r9, lsr #1     @ shift mask bit to the right
	bne _bits               @ if bit hasn't gone past LSB, loop
	
_exit:
	mov r0, #10		@ WS addition: new line at end
	str r0, [r1]		@ WS
	bl _write		@ WS
	mov r7, #1
	swi 0

_write:
	mov r0, #1		@ stdout is monitor
	mov r2, #1		@ write one char
	mov r7, #4		@ syscall number to write
	swi 0			@ execute
	bx lr			@ branch exchange: return to calling location

	.data
string:
	.ascii " "
