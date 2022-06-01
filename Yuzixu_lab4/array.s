.cpu cortex-a72
.fpu neon-fp-armv8

.data

.text
.align 2
.global array
.type array, %function

array:
	push {fp, lr}
	add fp, sp, #4

	push {r0}
	push {r1}
	push {r2}


	mov r10, #0
	arrayLoop:
		ldr r1, [sp, #4]
		cmp r10, r1
		bge endArray

		ldr r0, [sp, #8]
		ldr r2, [sp]

		str r2, [r0, r10]

		add r10, r10, #4
		b arrayLoop

	endArray:
		sub sp, fp, #4
		pop {fp, pc}
