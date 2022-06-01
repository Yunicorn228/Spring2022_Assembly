.cpu cortex-a72
.fpu neon-fp-armv8

.data

.text
.align 2

.global make_deck
.type make_deck, %function

make_deck:
	push {fp, lr}
	sub fp, sp, #4

	mov r0, r0, LSL #2
	push {r0}

	push {r1}
	mov r2, r2, LSL #2

	push {r2}
	mov r7, #0

	makeDeck:
		ldr r0, [sp, #8]
		cmp r7, r0

		bge endLoop

		create_new_deck:
			mov r0, #0
			ldr r1, [sp, #4]

			ldr r2, [r1, r7]
			cmp r2, r0

			ble deckIncrement
			sub r2, r2, #1

			str r2, [r1, r7]
			ldr r2, [sp]

			ldr r3, [r1, r2]
			add r3, r3, #1

			str r3, [r1, r2]

			deckIncrement:
				add r7, r7, #4
				b makeDeck

	endLoop:
		add sp, fp, #4
		pop {fp, pc}

