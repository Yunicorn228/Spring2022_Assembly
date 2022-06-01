.cpu cortex-a72
.fpu neon-fp-armv8

.data
.text

.align 2

.global init_deck
.type init_deck, %function

init_deck:
	push {fp, lr}
	sub fp, sp, #4

	mov r0, r0, LSL #2
	push {r0}

	push {r1}
	push {r2}
	push {r3}

	mov r8, #0

	init_deck_loop:
		ldr r0, [sp, #12]
		cmp r8, r0

		bge end_init_deck_loop
		bl rand

		ldr r1, [sp, #8]
		bl mod

		mov r0, r0, LSL #2
		ldr r2, [sp, #4]

		ldr r1, [r2, r0]
		ldr r2, [sp]

		ldr r3, [r2, r8]
		add r2, r1, r3

		ldr r1, [sp, #4]
		str r2, [r1, r0]

		ldr r2, [sp]
		mov r3, #0

		str r3, [r2, r8]
		add r8, r8, #4

		b init_deck_loop

	end_init_deck_loop:
		add sp, fp, #4
		pop {fp, pc}
