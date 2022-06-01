.cpu cortex-a72
.fpu neon-fp-armv8

.data

.text
.align 2

.global sort
.type sort, %function

sort:
    push {fp, lr}
    add fp, sp, #4
    push {r0}
    push {r1}

    mov r10, #0

    sortO:
       ldr r2, [sp]
       sub r2, r2, #1

       cmp r10, r2
       bge soEnd

       mov r2, r10, LSL #2
       ldr r3, [sp, #4]

       ldr r3, [r3, r2]
       add r9, r10, #1

       sortI:
           ldr r2, [sp]
           cmp r9, r2

           bge siEnd
           mov r2, r9, LSL #2

           ldr r0, [sp, #4]
           ldr r0, [r0, r2]

           cmp r3, r0
           ble else
           
           ldr r1, [sp, #4]
           mov r2, r10, LSL #2
           str r0, [r1, r2]

           mov r2, r9, LSL #2
           str r3, [r1, r2]

           mov r3, r0

           else:
              add r9, r9, #1
              b sortI

        siEnd:
           add r10, r10, #1
           b sortO

     soEnd:
        sub sp, fp, #4
        pop {fp, pc}


