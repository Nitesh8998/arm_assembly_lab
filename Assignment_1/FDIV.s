.EQU SWI_HALT, 0x011    @ MACRO to stop execution

.DATA
DIVIDEND: .word 1234
DIVISOR: .word 45

@ Try with DIVIDEND 8
@ Try with DIVISOR 3

.TEXT
.global _MAIN

@ DIV R1, R2, #45
_MAIN:
    LDR R4, =DIVIDEND       @ load the address of dividend into register 4
    LDR R5, =DIVISOR        @ load the address of divisor into register 5
    LDR R2, [R4]            @ load the value of register 4 to register 2
    LDR R3, [R5]            @ load the value of register 5 to register 3

    @ Divide by zero check
    CMP R3, #0              @ check register 3 is zero or not
    BEQ _EXIT               @ if zero flag is set exit the program

    @ Non restoring division
    MOV R1, R2              @ To maintain dividend in register 2 copy it to register 1
    MOV R4, #32             @ Maximum loop count to 32 
    MOV R0, #0              @ Set zero in register 0

_LOOP:
    MOV R5, R1, LSR #31     @ Get MSB of register 1 and store it in register 5
    ORRS R0, R5, R0, LSL #1 @ OR register 5 with left shift of register 0 contents by 1 and set conditional flags 
    BMI _ADD                @ If N flag is set do addition else perform subtraction
    SUBS R0, R0, R3         @ Subtract register 0 and 3; store the result back in register 0
    B _COMMON               @ Branch to _COMMON to skip addition part
_ADD:
    ADDS R0, R0, R3         @ Add register 0 and 3; store the result back in register 0
_COMMON:
    MOV R1, R1, LSL #1      @ Left shift register 1 by 1 and move back to register 1
    ORRPL R1, R1, #1        @ OR register 1 with #1 and store the result back to register 1 iff N flag is clear
    SUBS R4, R4, #1         @ Subtract register 4 contents and store it back
    BNE _LOOP               @ Perform loop till 32 operations which is register size

    CMP R0, #0              @ Compare the contents of register 0 with 0 if it is negative N flag would get set
    ADDMI R0, R0, R3        @ If N flag is set do addition to get reminder
_EXIT:
    SWI SWI_HALT


@ Note: R0 holds reminder, R1 hold quotient