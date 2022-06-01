.cpu cortex-a53
.fpu neon-fp-armv8

.data
outp: .asciz "%d\n"

.text
.align 2
.global main
.type main, %function

main:
    push {fp, lr}   @init the stack
    add fp, sp, #4

    bl getRolls     @get user input and return to r0
    mov r4, r0      @store the return value to r4 **counter for while_loop2**

    mov r0, #0      @allocate the stack **add sp, is not working**
    mov r1, #12      @the first num value
    mov r10, #11    @loop counter for while1

    while_loop1:
        cmp r10, #0
        ble exit_loop1

        push {r1}           @push the sum and count on stack
        push {r0}

        sub r1, r1, #1      @increment the sum value till 12
        sub r10, r10, #1    @decrement the loop cunter
        b while_loop1

    exit_loop1:


    mov r0, #0              @need to call there here to avoid bugs
    bl time
    bl srand

    while_loop:
        cmp r4, #0      @compare the input with 0
        ble exit_loop   @while the num of roll still have run the loop

        bl rollDie      @first time rollDie return to r0
        mov r5, r0      @store in r5
        bl rollDie      @second time rollDie return to r0
        add r5, r0, r5  @add in r5 get the total

        bl updateCount  @call updateCount

        sub r4, r4, #1  @decreament the count
        b while_loop    @back to while_loop

    exit_loop:
        bl printTable   @print the table


    sub sp, fp, #4
    pop {fp, pc}
