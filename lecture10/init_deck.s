.cpu cortex-a53
.fpu neon-fp-armv8

.data


.text
.align 2
.global init_deck
.type init_deck, %function


init_deck:
    push {fp, lr}
    add fp, sp, #4
    @ r0 = address of array
    @ r1 = address of number of decks
    push {r0}
    push {r1}

    @ Use the algorithm described in lecture
    mov r10, #45

    init_deck_loop:
       cmp r10, #0
       beq end_init_deck_loop

       @ generate random number from 1 to r10
       @ mod(#, r10) + 1
       bl rand
       mov r1, r10
       bl mod
       add r0, r0, #1

       @ Get the number of decks
       ldr r3, [fp, #-12]
       ldr r2, [r3]

       @ Get the array
       ldr r1, [fp, #-8]

       @ compute byte offset
       mov r2, r2, LSL #2

       str r0, [r1, r2]

       mov r2, r2, LSR #2

       add r2, r2, #1
       str r2, [r3]

       sub r10, r10, r0

       b init_deck_loop


    end_init_deck_loop:

    sub sp, fp, #4
    pop {fp, pc}

