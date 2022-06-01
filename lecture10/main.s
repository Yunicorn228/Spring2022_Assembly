.cpu cortex-a53
.fpu neon-fp-armv8

.data
outp1:     .asciz "this is the zero found value: %d\n"

.text
.align 2
.global main
.type main, %function


main:
    push {fp, lr}
    add fp, sp, #4

    @ randomize the seed
    mov r0, #0
    bl time
    bl srand

    @ Allocate memory for
    @ Array address
    @ Number of decks
    @ 46 elements array
    @ 48 *4 = 192 bytes

    sub sp, sp, #192

    @ store the address of the array into fp - 8
    str sp, [fp, #-8]

    @ store 0 into the fp - 12  - number of decks
    mov r0, #0
    str r0, [fp, #-12]

    @ call init_deck(array, address of number of decks)
    mov r0, sp
    sub r1, fp, #12

    bl init_deck


    ldr r0, [fp, #-8]  @ array
    ldr r1, [fp, #-12] @ number of decks
    bl print_array

        @testing the swap fuction
        @mov r0, sp
        @add r1, sp, #8
        @bl swap
    
    @Loop the game and end if handleCheckEndGame is true
    gamingLoop:
    @ldr r0, [fp, #-8]  @ array
    @ldr r1, [fp, #-12] @ number of decks
    @bl handleCheckEndGame
    mov r10, #10
    cmp r10, #1        @if the end game is ture(1) then end the loop
    @b endGaming

    @console.log(check if the handleEndGmae works)
    @ ldr r0, =outp1
    @ mov r1, r10
    @ bl printf

        @call the handleNextRound
        ldr r0, [fp, #-8]  @ array
        ldr r1, [fp, #-12] @ number of decks
        bl handleNextRound

        ldr r0, [fp, #-8]  @ array
        ldr r1, [fp, #-12] @ number of decks
        bl print_array

        sub r10, r10, #1


        @bl handleCheckZero
        @check if the stack contain any 0
        @,if it is, call swap and handelReduce 
        @bl swap
        @bl handelReduceDeck
        @deck size by 1(the last one of the  
        @array)

    @back to loop
    b gamingLoop

    endGaming:
    @ ldr r0, [fp, #-8]  @ array
    @ ldr r1, [fp, #-12] @ number of decks
    @ bl print_array

    @endgame

    sub sp, fp, #4
    pop {fp, pc}

