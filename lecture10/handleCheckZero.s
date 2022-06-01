.cpu cortex-a53
.fpu neon-fp-armv8

.data


.text
.align 2
.global handleCheckZero
.type handleCheckZero, %function


handleCheckZero:
    push {fp, lr}
    add fp, sp, #4

    @r0 == array adddress
    @r1 == number of deck

        checkZeroLoop:
            cmp r1, #0              @if the counter is no more end loop
            beq isNotZero

            @ldr r0, [fp, #-8]       @array address in r0
            @ldr r1, [fp, #-12]      @number of the deck AKA loop counter

            mov r2, r2, LSL #2
            ldr r3, [r0, r2]        @r0[r2] == arr[index]

            
            cmp r3, #0              @if arr[index] == 0 end loop
            beq isZero

            sub r1, r1, #1
            b checkZeroLoop

    isZero:
    mov r10, #-1
    b endcheck

    isNotZero:
    mov r10, #1
    
    endcheck:
    sub sp, fp, #4
    pop {fp, pc}
