	.file	"scan.s"
	.text
	.align	2
	.global	main
	.type	main, %function

/* main() reads two values from stdin, adds the values,
   then prints the result.
*/
main:
    push {lr}    // save lr

    // scanf("%d %d", &x, &y);
	sub	sp, sp, #8    // make room on the stack for two integers
    ldr r0, =rdfmt
    mov r1, sp        // put address of first parameter in r1
    add r2, sp, #4    // put address of second parameter in r2
    bl scanf          // read values and store in memory
     
    // retrieve values from memory
    add r0, sp, #0 
    ldr r1, [r0]	
    add r0, sp, #4 
    ldr r2, [r0]

    add r3, r1, r2
   
    // print result 
    ldr r0, =prtfmt
    bl printf        // operands are already in necessary regs
   
	add	sp, sp, #8    // make room on the stack for two integers
    pop {pc}         // put lr in pc    

	.section	.rodata
rdfmt:        .asciz "%d %d"
prtfmt:       .asciz "\n%d + %d = %d\n\n"

