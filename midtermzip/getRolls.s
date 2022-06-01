.cpu cortex-a53
.fpu neon-fp-armv8

.data
outp: .asciz "Enter the number :"
inpt: .asciz "%d"

.text
.align 2
.global getRolls
.type getRolls, %function

getRolls:
    push {fp, lr}
    add fp, sp, #4

    @printf("Enter a number ")
    ldr r0, =outp  
    bl printf      

    @get user input
    sub sp, sp, #4
    mov r1, sp
    ldr r0, =inpt
    bl scanf
    ldr r0, [sp]

    sub sp, fp, #4
    pop {fp, pc}
