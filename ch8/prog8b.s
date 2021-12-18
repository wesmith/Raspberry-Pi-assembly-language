/* prog8b.s from Bruce Smith book,
	WS 12/18/21
        print a number as a binary string */

	.global _start

_start:
	
	mov r6, #201 		@ test number to convert
	mov r10, #1		@ set up single-bit mask
	mov r9, r10, lsl #31	@ initialize bit to MSB, save in r9
	ldr r1, =string		@ point r1 to string

_bits:	
	tst r6, r9		@ compare test number to single bit in r9
	beq _print0		@ if bit not set in test number, print "0"
	mov r8, r6		@ preserve test number (why? is r6 used later?)
	mov r0, #49		@ ascii '1' in r0
	str r0, [r1]		@ store '1' at string location
	bl _write		@ write '1' to screen
	mov r6, r8		@ retrieve test number
	bal _noprint1		@ xxx

_print0:
	mov r8, r6		@ preserve test number
	mov r0, #48		@ ascii '0' in r0
	str r0, [r1]		@ store '0' at string location
	bl _write		@ write '0' to screen
	mov r6, r8		@ retrieve test number

_noprint1:
	movs r9, r9, lsr #1     @ shift mask bit to the right
	bne _bits               @ if bit hasn't gone past LSB, go to _bits

_exit:
	mov r0, #10		@ WS addition: new line at end
	str r0, [r1]		@ WS
	bl _write		@ WS
	mov r7, #1
	swi 0

_write:
	mov r7, #4		@ syscall number to write
	mov r0, #1		@ stdout is monitor
	mov r2, #1		@ write one char
	#ldr r1, =string	@ r1 already has string address
	swi 0			@ execute
	mov pc, lr		@ return to calling location

	.data
string:
	.ascii " "
