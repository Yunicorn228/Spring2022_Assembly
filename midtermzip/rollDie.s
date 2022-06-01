.cpu cortex-a53
.fpu neon-fp-armv8

.text
.align 2
.global rollDie
.type rollDie, %function

rollDie:
    push {fp, lr}
    add fp, sp, #4


    bl rand
    mov r1, #6
    udiv r2, r0, r1
    mul r2, r2, r1
    sub r2, r0, r2
    sub r2, r2, #1

    mov r0, r2

    sub sp, fp, #4
    pop {fp, pc}
