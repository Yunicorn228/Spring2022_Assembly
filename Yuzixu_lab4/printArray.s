.cpu cortex-a72
.fpu neon-fp-armv8

.data
out1:	.asciz	"\n"
out3:	.asciz	"[%d] == %d\n"

.text
.align 2

.global printArray
.type printArray, %function

printArray:
	push {fp, lr}
	add fp, sp, #4

	push {r0}
	mov r1 ,r1 , LSL #2

	push {r1}
	ldr r0, =out1

	bl printf
	mov r9, #0

	paLoop:
		ldr r1, [sp]
		cmp r9, r1

		bge endpa
		ldr r0, =out3

		mov r1, r9
		mov r1, r1, LSR #2

		add r1, r1, #1
		ldr r3, [sp, #4]

		ldr r2, [r3, r9]
		bl printf

		add r9, r9, #4
		b paLoop

	endpa:
		ldr r0, =out1
		bl printf
		sub sp, fp, #4
		pop {fp, pc}
