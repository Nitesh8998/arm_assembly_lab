.EQU SWI_HALT, 0x011    @ MACRO to stop execution

.DATA
MULTIPLICAND: .word 1234
MULTIPLIER: .word 54

.TEXT
.global _MAIN

@ MULF R1, R2, #54
_MAIN:
    LDR R4, =MULTIPLICAND   @ load the address of value1 into register 4
    LDR R5, =MULTIPLIER     @ load the address of value2 into register 5
    LDR R2, [R4]            @ load the value of register 4 to register 2
    LDR R3, [R5]            @ load the value of register 5 to register 3

    @ Check for multiplcation by zero
    MOV R1, #0              @ Move #0 to register 1
    CMP R3, #0              @ Compare whether register 3 is zero or not
    BEQ _EXIT               @ Exit the program by checking Z flag

    MOV R5, R2              @ Moving register 2 contents to register 5

_LOOP:
    ANDS R4, R3, #1         @ And register 3 with #1 and store result in register 4 and set conditional flags
    ADDNE R1, R1, R5        @ Check Z flag if not set do addition else NOP
    MOV R5, R5, LSL #1      @ Shift the content of register 5 by #1 to left and store back to register 5
    MOVS R3, R3, LSR #1     @ shit the content of register 3 by #1 to right and store back to register 3
    BNE _LOOP               @ Check Z flag if not set continue from _LOOP

_EXIT:
    SWI SWI_HALT
