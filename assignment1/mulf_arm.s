/******************************************************************************
* file: mulf_arm.s                                                            *
* Author: Jethin Sekhar R (CS18M523)                                          *
* Assembly code for Fast Multiply                                             *
******************************************************************************/

/*
@param value1  : r1
@param value2  : r2
@return value  : r1 * r3
*/

@ BSS section
.bss
ret_val: .word

@ DATA SECTION
.data
value1: .word 02
value2: .word 54

@ TEXT section
.text

.global _main

_main:
    LDR   R0, =value1           @ Get the address of value1
    LDR   R1, [R0]              @ Load value1 to R1
    LDR   R0, =value2           @ Get the address of value2
    LDR   R2, [R0]              @ Load value2 to R2
    MOV   R3, #0                @ Initialize R3 to Zero
    TST   R2, #1                @ Test R2 for 1st Bit
    ADDNE R3, R3, R1            @ ADD and with R3 if 1st bit Set
    TST   R2, #2                @ Test R2 for 2nd Bit
    ADDNE R3, R3, R1, LSL #1    @ ADD and with R3 if 2nd bit Set
    TST   R2, #4                @ Test R2 for 3rd Bit
    ADDNE R3, R3, R1, LSL #2    @ ADD and with R3 if 3rd bit Set
    TST   R2, #8                @ Test R2 for 4th Bit
    ADDNE R3, R3, R1, LSL #3    @ ADD and with R3 if 4th bit Set
    TST   R2, #16               @ Test R2 for 5th Bit
    ADDNE R3, R3, R1, LSL #4    @ ADD and with R3 if 5th bit Set
    TST   R2, #32               @ Test R2 for 6th Bit
    ADDNE R3, R3, R1, LSL #5    @ ADD and with R3 if 6th bit Set
    TST   R2, #64               @ Test R2 for 7th Bit
    ADDNE R3, R3, R1, LSL #6    @ ADD and with R3 if 7th bit Set
    TST   R2, #128              @ Test R2 for 8th Bit
    ADDNE R3, R3, R1, LSL #7    @ ADD and with R3 if 8th bit Set
    LDR   R0, =ret_val          @ Getting Address of Return Value
    STR   R3, [R0]              @ Store R1(result) into return value
