@ Alex Ward atward
@ CPSC 2310
@ Program 3
@ Due 10-25-16
@
@ Description: This is the main file that reads in 3 numbers from user input
@ 	and sends them to the mac function in prog3.s. It also prints out the
@	the answer once mac is finished.

	.text
	.global main
	.type main, %function

ans	.req r0
a	.req r1
bb	.req r2
c	.req r3

/*
 function name: main
 descriptioin: takes in user input for a, b, and c sends data to be calculated 
		in mac then prints the received answer.
 input parameters:
		a/r1 - holds the value for a input by the user
		bb/r2 - holds the value for b input by the user called bb because
			b is already a register
		c/r3 - holds the value for c input by the user
 return value:
		ans/r0 - holds the returned value from mac
 other output parameters:
		r0 is used to hold and output print statements
		r1,r2, and r3 are used to out put the values input by the user
 effect/output
		outputs the return value of mac
 method / effect:
		uses printf and scanf to prompt and record the user's input for a,
		b, and c	
 typical calling sequence:
		read all of the user input sequentially onto r1 incrementing the 
			stackpointer by 4.
		Print the "a + (b * c) =" part
		move a, bb, and c to r0-r2		
		load r0-r2 and send to mac
		receive the answer from mac in ans and move that to r1 for 
			printing
		print the answer			

 local register usage:
		r0 is used to hold all of the print statements and read formats
		a, bb, c hold the corresponding values from the user.
*/

main:
	push {c, lr}
	
	@make room for 3 integers	
	add sp, sp, #-12
	

	@prompt the user and read in 3 integers
	ldr r0, =prt_a
	bl printf
	ldr r0, =rdfmt	
	mov r1, sp
	bl scanf

	ldr r0, =prt_b
	bl printf
	ldr r0, =rdfmt
	add r1, sp, #4
	bl scanf
	
	ldr r0, =prt_c
	bl printf
	ldr r0, =rdfmt
	add r1, sp, #8
	bl scanf

	
	@put the user input into a, bb, and c
	add r0, sp, #0
	ldr a, [r0]
	add r0, sp, #4 	
	ldr bb, [r0]
	add r0, sp, #8
	ldr c, [r0]

	@ print "a + (b * c) =
	ldr r0, =prt_fmt1
	bl printf
	
	@prepare a, b, and c to be sent in r0, r1, and r2
	mov r0, a
	mov r1, bb
	mov r2, c

	@load r0-r2 and send them to mac
        ldmia sp, {r0-r2}
        bl mac
	
        @put answer in r1 and print it
	mov r1, ans 	
	ldr r0, =prt_fmt2
	bl printf

done:
	add sp, sp, #12
	pop {c, pc}

	.section	.rodata

rdfmt:	.asciz "%d"
prt_fmt1:	.asciz "%d + (%d * %d) = "
prt_fmt2:	.asciz "%d\n\n"
prt_a:	.asciz "input digit for A: "
prt_b:  .asciz "input digit for B: "
prt_c:  .asciz "input digit for C: "	

