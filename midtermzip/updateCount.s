.cpu cortex-a53
.fpu neon-fp-armv8

.data
outp: .asciz "this is r9 value%d\n"
outp2: .asciz "this is r0 value%d\n"


.text
.align 2
.global updateCount
.type updateCount, %function

updateCount:
    push {fp, lr}
    add fp, sp, #4

    mov r10, #11
    mov r9, #14         @this is the constant when calcuating the location
    mov r8, #8          @this is also the constant
    while_loop3:
        cmp r10, #0
        ble exit_loop3
        add r10, #1         @increment the r10 by 1 and compare with the result in r5
        ifequal:
            cmp r5, r10         @if the value is equal to the counter**12--2** the increment count
            bne else            @or dont do anyhing
            sub r5, r9, r5      @14 - x = cosntant
            mul r5, r8          @constant * 8 = sp localtion need to go **r5**

            add sp, sp, r5      @r5 have the location of the count
            ldr r1, [sp]        @load it out and add 1
            add r1, r1, #1
            str r1, [sp]
            sub sp, sp, r5      @return the sp
            b exit_loop3

        else:
            sub r10, r10, #2    @decrement by 2 because add 1 earlier
        b while_loop3

    exit_loop3:


    sub sp, fp, #4
    pop {fp, pc}







