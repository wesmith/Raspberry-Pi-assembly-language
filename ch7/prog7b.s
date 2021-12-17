/* prog7b.s from Bruce Smith book,
	WS 12/17/21
	read from keyboard */

	.global _start

_start:

_read:	@ read syscall
	mov r7, #3	@ syscall number to read
	mov r0, #0	@ stdin is keyboard
	mov r2, #5	@ read first 5 chars
	ldr r1, =string @ address of 'string' to r1
	swi 0		@ execute the syscall

_write:	@ write syscall
	mov r7, #4  	@ syscall number to write
	mov r0, #1	@ stdout is monitor
	mov r2, #19	@ string length in chars (actually 19: exeriment)
	ldr r1, =string	@ address of string to r1
	swi 0		@ execute

_exit:	@ exit syscall
	mov r7, #1	@ syscall number to exit
	swi 0		@ execute

	.data
string:
	.ascii "Hello World String\n"

