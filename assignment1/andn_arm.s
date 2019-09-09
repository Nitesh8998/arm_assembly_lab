/******************************************************************************
* file: andn_arm.s                                                            *
* Author: Jethin Sekhar R (CS18M523)                                          *
* Assembly code for Bit-wise and of r2 and !r3 (compliment of r3)             *
******************************************************************************/

/*
@param value1  : r2
@param value2  : r3
@return value  : r2 & !r3
*/

@ BSS section
.bss
ret_val: .word

@ DATA SECTION
.data
value1: .word 0xAAAAAAAA
value2: .word 0x55555555

@ TEXT section
.text

.global _main

_main:
    LDR   R0, =value1    @ Get the address of value1
    LDR   R1, [R0]       @ Load value1 to R1
    LDR   R0, =value2    @ Get the address of value2
    LDR   R2, [R0]       @ Load value2 to R2
    MVN   R2, R2         @ Complement R2 and Store in R2(Move Not)
    AND   R1, R1, R2     @ R1 = R1 & R2
    LDR   R0, =ret_val   @ Getting Address of Return Value
    STR   R1, [R0]       @ Store R1(result) into return value