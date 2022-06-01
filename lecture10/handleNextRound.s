.cpu cortex-a53
.fpu neon-fp-armv8

.data


.text
.align 2
.global handleNextRound
.type handleNextRound, %function


handleNextRound:
    push {fp, lr}
    add fp, sp, #4

    push {r0}
    push {r1}

    @r0 == array address
    @r1 == number of deck

    decrementLoop:
        cmp r1, #0
        beq endDecLoop
        mov r2, r2, LSL #2
        ldr r3, [r0, r2]
        sub r3, r3, #1
        str r3, [r0, r2]
        sub r1, r1, #1
 
        b decrementLoop


    endDecLoop:
    sub sp, fp, #4
    pop {fp, pc}
