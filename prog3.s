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

ans	.req r0
a	.req r1
bb	.req r2
c	.req r3


mac: 

	push {c, lr}

	mul bb, c, bb
	add a, a, bb
	mov ans, a

done: 

	pop {c, pc}

.unreq ans
.unreq a
.unreq bb
.unreq c

