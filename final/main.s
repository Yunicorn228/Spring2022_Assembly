.cpu cortex-a53
.fpu neon-fp-armv8
.syntax unified

.data
outp: .asciz "%f\n"
outp1: .asciz "Enter the number"

.text
.align 2
.global main
.type main, %function

main:
     sub     sp, sp, 24      @ space for saving regs
                                @ (keeping 8-byte sp align)
        str     r4, [sp, 4]     @ save r4
        str     r5, [sp, 8]     @      r5
        str     r6, [sp,12]     @      r6
        str     fp, [sp, 16]    @      fp
        str     lr, [sp, 20]    @      lr
        add     fp, sp, 20      @ set our frame pointer
        sub     sp, sp, argSpace  @ room to pass args

    ldr r0 =inp2            @prop for input
    bl scanf

    vldr s0, [sp]           @load the first number into the s0, and the number should be in the sp
    vldr s1, [sp, #-4]      @load the second num to the s1, the num should be in the sp - 4 location
    vadd.f32 s2, s0, s1

    vcvt.f64.f32 d5, s2     @covert to the 64 bits
    vmov r1, r3, d5
    mov r1, #0
    mov r2, #0
    ldr r0, =outp

    bl printf

     mov     r0, 0
        add     sp, sp, argSpace   @ deallocate arguments
        ldr     r4, [sp, 4]     @ restore r4
        ldr     r5, [sp, 8]     @      r5
        ldr     r6, [sp,12]     @      r6
        ldr     fp, [sp, 16]    @      fp
        ldr     lr, [sp, 20]    @      lr
        add     sp, sp, 24      @      sp
        bx      lr              @ return