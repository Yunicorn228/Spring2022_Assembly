.cpu cortex-a53
.fpu neon-fp-armv8

.data
inp1: .asciz "Enter two positive integers: "
inp2: .asciz "%d %d"
outp1: .asciz "Prime numbers between %d and %d are: "
outp2: .asciz "%d "

.text
.align 2
.global main
.type main, %function

main: 
	push {fp, lr}
	add fp, sp, #4

	ldr r0, =inp1
	bl printf

	sub sp, sp, #16
	

	ldr r0, =inp2
	sub r2, fp, #8
	sub r1, fp, #12
	bl scanf


				
	ldr r0, =outp1
	ldr r2, [fp, #-8]	@r2 is n2
	ldr r1, [fp, #-12]	@r1 is n1
	mov r5, r1	@n1 now in r5
	mov r6, r2	@n2 now in r6

	bl printf
	
	add r7, r5, #1	@r0 and r1 will hold i
	
loop:
	cmp r7, r6	@exit loop if i >= n2
	bge exit
	
	mov r0, r7	
	bl checkPrimeNumber @r0 is now flag

	cmp r0, #1
	beq pOut	@to print output
	
	add r7, r7, #1
	b loop

pOut:
	ldr r0, =outp2
	mov r1, r7
	bl printf

	add r7, r7, #1
	b loop

exit:
	sub sp, fp, #4
	pop {fp, pc}
	bx lr
