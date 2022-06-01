.cpu cortex-a53
.fpu neon-fp-armv8

.data
outp: .asciz "       %d                      %d         \n"
outp2: .asciz "sum of the dice      number of occurences\n"


.text
.align 2
.global printTable
.type printTable, %function

printTable:
    push {fp, lr}
    add fp, sp, #4

    ldr r0, =outp2  @print the title
    bl printf

    mov r9, #11
    mov r8, #8

    while_loop:
        cmp r9, #0
        ble exit_loop
        add r8, r8, #4      @add four for the first sum
        ldr r1, [sp, r8]
        add r8, r8, #4
        ldr r2, [sp, r8]    @add four for the count
        ldr r0, =outp
        bl printf
        sub r9, #1

        b while_loop

    exit_loop:
        sub sp, fp, #4
        pop {fp, pc}



