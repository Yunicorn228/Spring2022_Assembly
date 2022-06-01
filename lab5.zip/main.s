.cpu cortex-a53
.fpu neon-fp-armv8

.data

filename:  .asciz "data.txt"
inp:       .asciz "r"
outp:      .asciz "Computer:%s\n"
outp1:     .asciz "%d\n"
outp2:     .asciz "Computer: you are lost!\n"
outp4:     .asciz "Congratulations! you win!\n"
hang1:        .asciz "Number of lives lost: %d H------\n"
hang2:        .asciz "Number of lives lost: %d HA-----\n"
hang3:        .asciz "Number of lives lost: %d HAN----\n"
hang4:        .asciz "Number of lives lost: %d HANG---\n"
hang5:        .asciz "Number of lives lost: %d HANGM--\n"
hang6:        .asciz "Number of lives lost: %d HANGMA-\n"
hang7:        .asciz "Number of lives lost: %d HANGMAN\n"

.text

.align 2
.global main
.type main, %function


main:
     push {fp, lr}
     add fp, sp, #4

     @ Allocate memory for keyword
     mov r0, #80
     bl malloc
     push {r0}  @ fp - 8

     @ open file for reading
     @ fopen("data.txt", "r);
     ldr r0, =filename
     ldr r1, =inp
     bl fopen
     push {r0}  @ fp - 12

     @ getkeyword(address of file, address of keyword)
     ldr r0, [fp, #-12]
     ldr r1, [fp, #-8]
     bl getkeyword

     @ close the open file
     ldr r0, [fp, #-12]  @ gets the address inside stack location
     bl fclose  @ fclose(fp);

     @ Allocate memory for unknown
     ldr r0, [fp, #-8]
     bl strlen  @ get length of keyword
     bl malloc
     push {r0}

     @ Initialize unknown to '-'
     ldr r0, [fp, #-8]
     bl strlen
     mov r1, r0
     ldr r0, [fp, #-16]
     bl init_unknown


     @ print out word
     @ldr r0, =outp
     @ldr r1, [fp, #-8]   @ keyword address
     @bl printf

     @print out unknown
     ldr r0, [fp, #-8]
     bl strlen
     mov r1, r0
     ldr r0, [fp, #-16]  @ address of unknown array
     bl print_array

     @ play hangman, need to loop until game is over

     mov r6, #1        @loop counter
     mov r4, #0          @winning counter
     mov r7, #0         @losing counter
     
     play_hangman_loop:
     @cmp r6, #7       @check avalible lives for human
     @bge endPlayLoop
     
     @ Get user guess
     @ get_guess(address to write to)
     @ Use the stack to get the gues
     sub sp, sp, #4
     mov r0, sp
     bl get_guess

     mov r0, sp
     mov r1, #1
     bl print_array

     @ Check the guess
     @ check guess returns -1 if the guess is not in the keyword
     @ else flips the unknown characters matching guess
     @ index = check_guess(keyword, unknown, guess)
     ldr r0, [fp, #-8]
     ldr r1, [fp, #-16]
     mov r2, sp
     bl check_guess  @ return integer into r0

     @if return -1 then the live -1 and print out HANGMAN
     mov r1, r0
     cmp r1, #-1
     bne HandlePrintRightGuess

                                        
                                        add r7, r7, #1    @losinf counter++
                                        cmp r6, #7       @check avalible lives for human
                                        bge endPlayLoop
                                        add r6, r6, #1      @lopp counter++
                                        
                                        cmp r7, #1
                                        beq handlePrint1
                                        cmp r7, #2
                                        beq handlePrint2
                                        cmp r7, #3
                                        beq handlePrint3
                                        cmp r7, #4
                                        beq handlePrint4
                                        cmp r7, #5
                                        beq handlePrint5
                                        cmp r7, #6
                                        beq handlePrint6
                                        cmp r7, #7
                                        beq handlePrint7

                                        handlePrint1:
                                        ldr r0, =hang1
                                        mov r1, r7
                                        bl printf
                                        b play_hangman_loop

                                        handlePrint2:
                                        ldr r0, =hang2
                                        mov r1, r7
                                        bl printf
                                        b play_hangman_loop

                                        handlePrint3:
                                        ldr r0, =hang3
                                        mov r1, r7
                                        bl printf
                                        b play_hangman_loop

                                        handlePrint4:
                                        ldr r0, =hang4
                                        mov r1, r7
                                        bl printf
                                        b play_hangman_loop

                                        handlePrint5:
                                        ldr r0, =hang5
                                        mov r1, r7
                                        bl printf
                                        b play_hangman_loop

                                        handlePrint6:
                                        ldr r0, =hang6
                                        mov r1, r7
                                        bl printf
                                        b play_hangman_loop

                                        handlePrint7:
                                        ldr r0, =hang7
                                        mov r1, r7
                                        bl printf
                                   
     
     b play_hangman_loop

     HandlePrintRightGuess:
          ldr r0, [fp, #-8]
          bl strlen

          add r4, r4, #1
          cmp r4, r0
          beq handleWinner
          
          @ldr r0, =outp1
          @bl printf
          

          @ print out unknown
          ldr r0, [fp, #-8]
          bl strlen @get the string length
          mov r1, r0
          ldr r0, [fp, #-16]  @ address of unknown array
          bl print_array
          
          b play_hangman_loop
          
          handleWinner:
               ldr r0, =outp4
               bl printf
               b endProgram

     endPlayLoop:
          ldr r0, =hang7
          mov r1, r7
          bl printf
     
          ldr r0, =outp2
          bl printf

     endProgram:
          @ free memory
          ldr r0, [fp, #-8]
          bl free

          ldr r0, [fp, #-16]
          bl free

          sub sp, fp, #4
          pop {fp, pc}