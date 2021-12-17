/* prog7a.s from Bruce Smith book,
	WS 12/17/21
	write a string to the screen */

	.global _start

_start:
	mov r7, #4  	@ syscall number
	mov r0, #1	@ stdout is monitor
	mov r2, #19	@ string length in chars (actually 19: exeriment)
	ldr r1, =string	@ address of string to r1
	swi 0		@ this executes the syscall

_exit:	@ exit syscall
	mov r7, #1
	swi 0

	.data
string:
	.ascii "Hello World String\n"
	
