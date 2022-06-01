@ addFloat2.s
@ Adds two floats and prints results

@ Define my Raspberry Pi
        .cpu    cortex-a53
        .fpu    neon-fp-armv8
        .syntax unified         @ modern syntax

@ Constants for assembler
        .equ    arg3,0  @ args to printf
        .equ    arg4,8
        .equ    argSpace,16

@ Constants for assembler
        .section  .rodata
        .align  2
format:
        .asciz  "%f\n"

@ The program
        .text
        .align  2
x:
	.float 1.23
        .global main
        .type   main, %function
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

        vldr    s0, x           @ load x into fp reg
        @vldr    s1, y           @ load y into fp reg
        @vadd.f32 s2, s1, s0     @ fp add
        
        ldr     r0, formatAddr  @ pointer to format string
        vcvt.f64.f32  d5, s0    @ convert x to double
        vmov   r2, r3, d5       @ pass x in r2/r3
        vcvt.f64.f32  d6, s1    @ convert y to double
        vstr    d6, [sp, arg3]  @ pass y on stack
        vcvt.f64.f32  d7, s2    @ convert z to double
        vstr    d7, [sp, arg4]  @ pass z on stack
        bl      printf

        mov     r0, 0
        add     sp, sp, argSpace   @ deallocate arguments
        ldr     r4, [sp, 4]     @ restore r4
        ldr     r5, [sp, 8]     @      r5
        ldr     r6, [sp,12]     @      r6
        ldr     fp, [sp, 16]    @      fp
        ldr     lr, [sp, 20]    @      lr
        add     sp, sp, 24      @      sp
        bx      lr              @ return

        .align  2
@x:
@        .float  1.23
y:
        .float  4.56
formatAddr:
        .word   format

