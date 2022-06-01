@ define computer architecture
.cpu cortex-a53
.fpu neon-fp-armv8

.data
outp:   .asciz "Enter a Number: "
inp:    .asciz "%d"
outp2:  .asciz "The fibo number = %d\n"

.text
.align 2
.global main
.type main, %function

main:
    @save the value of the LR into r4
    mov r10, lr

    @printf("Enter a number ")
    ldr r0, =outp   @r0 = "Enter a number"
    bl printf       @print out

    @get user input
    sub sp, sp, #4
    mov r1, sp
    ldr r0, =inp
    bl scanf
    ldr r4, [sp]
    add sp, sp, #4

    @set the first and second num
    mov r6, #0      @the first num = 0
    mov r7, #1      @the second num = 1

    while_loop:
        cmp r4, #1
        blt exit_loop       @bigger or equal to
        mov r8, r7          @tmep = r7
        add r7, r7, r6      @r7 = r6 + r7
        mov r6, r8          @r6 = temp
        sub r4, r4, #1      @r4--
        b while_loop

    exit_loop:
        ldr r0, =outp2
        mov r1, r6
        bl printf

        mov r0, #0
        mov lr, r10
        bx lr

