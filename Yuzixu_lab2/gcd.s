.cpu cortex-a53
.fpu neon-fp-armv8

.data
outp: .asciz "Enter the numbers"
inp2: .asciz "%d %d"
outtext: .asciz "The GCD is %d\n"

.text
.align 2
.global main
.type main, %function

main:
	push {fp, lr}
	add fp, sp, #4

	sub sp, sp, #16
	mov r1, sp

	sub r1, fp, #16
	sub r2, fp, #12
      
	ldr r0, =inp2
	bl scanf

	ldr r1, [fp, #-16]
	ldr r2, [fp, #-12]

	cmp r1, r2
	blt switch

	b loop

switch:
	mov r0, r1
	mov r1, r2
	mov r2, r0

loop:
	udiv r4, r1, r2 @r4 = r1/r2
	mul r5, r4, r2 @r5 = r4*r2
	sub r6, r1, r5 @r6 = r1-r5

	cmp r6, #0
	beq noRemain

	mov r1, r2
	mov r2, r6
	b loop

noRemain:

	ldr r0, =outtext
	mov r1, r2 @output b
	bl printf

	sub sp, fp, #4
	pop {fp, pc}
	bx lr
