.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global checkPrimeNumber
.type checkPrimeNumber, %function

checkPrimeNumber:
	push {fp, lr}
	add fp, sp, #4

	mov r7, r0 @r7 is my arbitrarily designated location for n
	
	mov r2, #2 	@r2 is arbitrary j
	udiv r3, r7, r2	
	mov r0, #1	@1 to be returned by default

loop:
	cmp r2, r3
	bgt exit

	udiv r4, r7, r2	
			@r4 = n / j
	mul r5, r2, r4	
			@r5 = j * r4
	sub r6, r7, r5	
			@r6 = n - r5
	
	cmp r6, #0
	beq changeFlag
	
	add r2, r2, #1 
	b loop

changeFlag:
	mov r0, #0

exit:
	sub sp, fp, #4
	pop {fp, pc}
