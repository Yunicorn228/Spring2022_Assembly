 .arch armv6
 .eabi_attribute 28, 1
 .eabi_attribute 20, 1
 .eabi_attribute 21, 1
 .eabi_attribute 23, 3
 .eabi_attribute 24, 1
 .eabi_attribute 25, 1
 .eabi_attribute 26, 2
 .eabi_attribute 30, 6
 .eabi_attribute 34, 1
 .eabi_attribute 18, 4
 .file "test.c"
 .text
 .section .rodata
 .align 2
.LC0:
 .ascii "Area = %.2f\012\000"
 .text
 .align 2
 .global main
 .arch armv6
 .syntax unified
 .arm
 .fpu vfp
 .type main, %function
main:
 @ args = 0, pretend = 0, frame = 8
 @ frame_needed = 1, uses_anonymous_args = 0
 push {fp, lr}
 add fp, sp, #4
 sub sp, sp, #8
 ldr r3, .L3+8
 str r3, [fp, #-8] @ float
 vldr.32 s15, [fp, #-8]
 vcvt.f64.f32 d7, s15
 vldr.64 d6, .L3
 vmul.f64 d6, d7, d6
 vldr.32 s15, [fp, #-8]
 vcvt.f64.f32 d7, s15
 vmul.f64 d7, d6, d7
 vcvt.f32.f64 s15, d7
 vstr.32 s15, [fp, #-12]
 vldr.32 s15, [fp, #-12]
 vcvt.f64.f32 d7, s15
 vmov r2, r3, d7
 ldr r0, .L3+12
 bl printf
 mov r3, #0
 mov r0, r3
 sub sp, fp, #4
 @ sp needed
 pop {fp, pc}
.L4:
 .align 3
.L3:
 .word -266631570
 .word 1076437497
 .word 1084227584
 .word .LC0
 .size main, .-main
 .ident "GCC: (Raspbian 10.2.1-6+rpi1) 10.2.1 20210110"
 .section .note.GNU-stack,"",%progbits