.cpu cortex-a72
.fpu neon-fp-armv8

.data
round:	.asciz	"the current round is %d\n"

.text
.align 2

.global main
.type main, %function

main:
	push {fp, lr}
	add fp, sp, #4

	mov r0, #0
	bl time					@get the random num for initDeck
	bl srand

	sub sp, sp, #12
	sub sp, sp, #180
	str sp, [fp, #-8]
	mov r0, sp
	mov r1, #180
	mov r2, #1
	bl array
	
	sub sp, sp, #180
	str sp, [fp, #-12]

	mov r0, sp
	mov r1, #180
	mov r2, #0
	bl array

	bl rand
	mov r1, #45

	bl mod
	str r0, [fp, #-16]
	mov r0, #45
	ldr r1, [fp, #-16]
	ldr r2, [fp, #-12]
	ldr r3, [fp, #-8]

	bl init_deck

mov r4, #0

solitaire:
	ldr r0, =round
	mov r1, r4
	bl printf
	mov r0, #80
	cmp r0, r4
	beq endGame

	mov r0, #46
	ldr r1, [fp, #-12]
	ldr r2, [fp, #-16]
	bl make_deck

	ldr r0, [fp, #-16]
	add r0, r0, #1
	str r0, [fp, #-16]
	ldr r0, [fp, #-16]
	ldr r1, [fp, #-12]
	bl swap
	
	str r0, [fp, #-16]
	ldr r0, [fp, #-12]
	ldr r1, [fp, #-16]

	bl sort
	ldr r0, [fp, #-12]
	ldr r1, [fp, #-16]

	bl printArray
	ldr r0, [fp, #-16]
	ldr r1, [fp, #-12]
	bl stop

	add r4, r4, #1
	b solitaire

endGame:
	sub sp, fp, #4
	pop {fp, pc}
