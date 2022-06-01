.cpu cortex-a72
.fpu neon-fp-armv8

.data
.text

.align 2
.global swap
.type swap, %function

swap:
	push {fp, lr}
	sub fp, sp, #4

	mov r0, r0, LSL #2

	push {r0}
	push {r1}

	mov r6, #0
	szLoop:
		ldr r0, [sp, #4]
		cmp r6, r0
		bge szlEnd

		szIf:
			ldr r0, [sp]
			ldr r1, [r0, r6]
			mov r3, #0
			cmp r1, r3
			bne szlIncr

			ldr r3, [sp, #4]
			sub r3, r3, #4

			ldr r1, [r0, r6]
			ldr r2, [r0, r3]

			str r1, [r0, r3]
			str r2, [r0, r6]

			ldr r2, [sp, #4]
			sub r2, r2, #4
			str r2, [sp, #4]

			szlIncr:
				add r6, r6, #4
				b szLoop

	szlEnd:
		ldr r0, [sp, #4]
		mov r0, r0, LSR #2
		add sp, fp, #4
		pop {fp, pc}

