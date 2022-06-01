.cpu cortex-a72
.fpu neon-fp-armv8

.data

.text
.align 2

.global stop
.type stop, %function

stop:
	push {fp, lr}
	add fp, sp, #4
	
	push {r0}	
	push {r1}

	mov r3, #0
	push {r3}	

	mov r2, #0
	push {r2}

	mov r5, #1	
	stopLoop:
		ldr r0, [sp, #12]
		add r0, r0, #2

		cmp r5, r0
		bge ssLoop

		stopIf:
			ldr r0, [sp, #8]
			sub r1, r5, #1

			mov r1, r1, LSL #2
			ldr r0, [r0, r1]

			cmp r0, r5
			bne stopIncr

			ldr r2, [sp, #4]
			add r2, r2, #1
			str r2, [sp, #4]

	stopIncr:
		add r5, r5, #1
		b stopLoop

	ssLoop:
		ldr r0, [sp, #4]
		sub sp, fp, #4
		pop {fp, pc}

