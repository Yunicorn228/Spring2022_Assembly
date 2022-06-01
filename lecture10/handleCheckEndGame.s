.cpu cortex-a53
.fpu neon-fp-armv8

.data


.text
.align 2
.global handleCheckEndGame
.type handleCheckEndGame, %function


handleCheckEndGame:
    push {fp, lr}
    add fp, sp, #4

    @r0 == array adddress
    @r1 == number of deck

    cmp r1, #9      @check if deck num is 9
    bne falseEndGame

        checkZeroLoop:
            cmp r1, #0              @if the counter is no more end loop
            beq trueEndGame

            @ldr r0, [fp, #-8]       @array address in r0
            @ldr r1, [fp, #-12]      @number of the deck AKA loop counter

            mov r2, r2, LSL #2
            ldr r3, [r0, r2]        @r0[r2] == arr[index]

            
            cmp r3, r2              @if arr[index] == index end loop
            beq falseEndGame

            @change to the next array index????

            sub r1, r1, #1          @-- the loop counter
            b checkZeroLoop

    falseEndGame:
    mov r10, #-1
    b endcheck

    trueEndGame:
    mov r10, #1
    
    endcheck:
    sub sp, fp, #4
    pop {fp, pc}
