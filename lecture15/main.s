.cpu cortex-a53
.fpu neon-fp-armv8
.syntax unified

.data
outp: .asciz  "%f\n"

.text
.align 2
.global main
.type main, %function

x:
	.float 7.65
y:
	.float 3.33

main:
    push {fp, lr}
    add fp, sp, #4

    vldr s0, x
    vldr s1, y
    vadd.f32 s2, s0, s1

    vcvt.f64.f32 d5, s2
    vmov r1, r3, d5
    mov r1, #0
    mov r2, #0
    ldr r0, =outp

    bl printf

    sub sp, fp, #4
    pop {fp, pc}
