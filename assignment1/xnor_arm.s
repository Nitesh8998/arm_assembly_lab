/******************************************************************************
* file: xnor_arm.s                                                            *
* Author: Jethin Sekhar R (CS18M523)                                          *
* Assembly code for XNOR r1, r2, r3                                           *
******************************************************************************/

/*
@param value1  : r2
@param value2  : r3
@return value  : !(r2 ^ r3)
*/

@ BSS section
.bss
ret_val: .word

@ DATA SECTION
.data
value1: .word 0xFF00AA55
value2: .word 0xFF0055AA

@ TEXT section
.text

.global _main

_main:
    LDR   R0, =value1    @ Get the address of value1
    LDR   R1, [R0]       @ Load value1 to R1
    LDR   R0, =value2    @ Get the address of value2
    LDR   R2, [R0]       @ Load value2 to R2
    EOR   R1, R1, R2     @ EOR R1 and R2
    MVN   R1, R1         @ Complement R1 (Move Not)
    LDR   R0, =ret_val   @ Getting Address of Return Value
    STR   R1, [R0]       @ Store R1(result) into return value
