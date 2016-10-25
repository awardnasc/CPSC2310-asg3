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

/*
 function name: mac
 descriptioin: takes in user input for a, b, and c from main it then multiplies 
		b and c then adds the answer to a to get the final answer
 input parameters:
		a/r1 - holds the value for a input by the user
		bb/r2 - holds the value for b input by the user called bb because
			b is already a register
		c/r3 - holds the value for c input by the user
 return value:
		ans/r0 - holds the final value from the calculation
 other output parameters:
		none
 effect/output
		Sends the answer in ans back to main
 method / effect:
		multiply b and c,  add that number to a then return that number to
		main in ans 	
 typical calling sequence:
		push lr
		multiply c by bb and set that to bb
		add the new bb to a saving that in a/r0
		pop lr			

 local register usage:
		a - holds the value for a and then the final answer
		bb - holds b and then b * c
		c - holds c
*/

mac: 
        
	push {lr}
	
	@ a + (b * c) = a
	mul bb, c, bb
	add a, a, bb
	
done: 

	pop {pc}

.unreq a
.unreq bb
.unreq c

