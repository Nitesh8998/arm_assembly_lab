.EQU SWI_HALT, 0x011    @ MACRO to stop execution

.DATA
value1: .word 0xF0
value2: .word 0x11

.TEXT
.global _MAIN

@ ANDN R1, R2, R3
_MAIN:
    LDR R4, =value1     @ load the address of value1 into register 4
    LDR R5, =value2     @ load the address of value2 into register 5
    LDR R2, [R4]        @ load the value of register 4 to register 2
    LDR R3, [R5]        @ load the value of register 5 to register 3
    BIC R1, R2, R3      @ Bit clear operation do same (AND and NOT)

    SWI SWI_HALT
