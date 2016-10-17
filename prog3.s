@ Alex Ward atward
@ CPSC 2310
@ Program 3
@ Due 10-25-16
@
@ Description: This file contains the mac function for prog3
@	it multiplies the values of bb and c, and adds that 
@	to a 


	.text
	.global mac
	.type mac, %function

a	.req r0
bb	.req r1
c	.req r2
temp	.req r3


mac: 

	push {lr}

	mul temp, bb, c
	add a, a, temp


done: 

	pop {pc}
   
.unreq a
.unreq bb
.unreq c
.unreq temp
