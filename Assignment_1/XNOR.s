.EQU SWI_HALT, 0x011    @ MACRO to stop execution

.DATA
value1: .word 0xA
value2: .word 0x5

.TEXT
.global _MAIN

@ XNOR R1, R2, R3
_MAIN:
    LDR R4, =value1     @ load the address of value1 into register 4
    LDR R5, =value2     @ load the address of value2 into register 5
    LDR R2, [R4]        @ load the value of register 4 to register 2
    LDR R3, [R5]        @ load the value of register 5 to register 3
    EOR R1, R2, R3      @ XOR the value of register 2 and 3; store the result in register 1
    MVN R1, R1          @ Negate the value of register 1 and store back to register 1

    SWI SWI_HALT
