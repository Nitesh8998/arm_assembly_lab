.EQU SWI_HALT, 0x011    @ MACRO to stop execution

.DATA
value1: .word 0xFFFFFFFF

.TEXT
.global _MAIN

@ ABS R1, R2
_MAIN:
    LDR R4, =value1     @ load the address of value1 into register 4
    LDR R2, [R4]        @ load the value of register 4 to register 2
    MOV R3, R2, ASR #31 @ Make arithmetic shift of register 2 and store the result in register 3
                        @ Sign extension of value1
    ADD R2, R2, R3      @ For positive number R2 will be same
                        @ For negative number it will be 1's complement of abs number
    EOR R1, R2, R3      @ XOR the value of register 2 and 3; store the result in register 1

    SWI SWI_HALT

