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

main:
	push {c, lr}
	add sp, sp, #-12
	
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

	add r0, sp, #0
	ldr a, [r0]
	add r0, sp, #4 	
	ldr bb, [r0]
	add r0, sp, #8
	ldr c, [r0]

	ldr r0, =prt_fmt1
	bl printf
	
        ldmia sp, {a-c}
        bl mac
	
	mov r1, ans 	@put answer in r1
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
