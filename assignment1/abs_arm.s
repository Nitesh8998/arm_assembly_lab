/******************************************************************************
* file: abs_arm.s                                                             *
* Author: Jethin Sekhar R (CS18M523)                                          *
* Assembly code for ABS implementation                                        *
******************************************************************************/

/*
@param value  : input number
@return value : absolute value
*/

@ BSS section
.bss
ret_val: .word

@ DATA SECTION
.data
value: .word -66

@ TEXT section
.text

.global _main

_main:
    LDR   R0, =value        @ Getting Address of Input
    LDR   R1, [R0]          @ Load the Value of Input to R1
    CMP   R1, #0            @ Compare Against 0 and set neg flag in cpsr
    RSBMI R1, R1, #0        @ Reverse Substraction if neg flag is set
    LDR   R2, =ret_val      @ Getting Address of return value
    STR   R1, [R2]          @ Store Value into return value
