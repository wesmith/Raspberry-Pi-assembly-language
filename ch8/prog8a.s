/* prog8a.s from Bruce Smith book,
	WS 12/18/21
	toggle a character case from cap case to lower case
	(lower case is unaffected because of ORR operation) */

	.global _start

_start:
	
_read:	@ read syscall
	mov r7, #3 		@ syscall number to read
	mov r0, #0 		@ stdin is keyboard
	mov r2, #1		@ read one char
	ldr r1, =string 	@ address of char to r1
	swi 0			@ execute syscall

_togglecase:
	ldr r1, =string 	@ address of char
	ldr r0, [r1]		@ load char into r0
	orr r0, r0, #0x20 	@ change case
	str r0, [r1]      	@ write char back to mem

_write:
	mov r7, #4		@ syscall number to write
	mov r0, #1		@ stdout is monitor
	mov r2, #1		@ write one char
	ldr r1, =string		@ address of char
	swi 0			@ execute

_exit:
	mov r7, #1
	swi 0

	.data
string:
	.ascii " "
