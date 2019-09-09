/******************************************************************************
* file: divf_arm.s                                                            *
* Author: Jethin Sekhar R (CS18M523)                                          *
* Assembly code for Fast Division                                             *
******************************************************************************/

/*
@param value1  : r1
@param value2  : r2
@return value  : r1 / r2
*/

@ BSS section
.bss
ret_val: .word

@ DATA SECTION
.data
value1: .word 91
value2: .word 45

@ TEXT section
.text

.global _main

_main:
    LDR   R0, =value1             @ Get the address of value1
    LDR   R1, [R0]                @ Load value1 to R1
    MOV   R2, #45                 @ Initialize R2
    MOV   R3, R1, ASR #6          @ Divide by 2^6
    ADD   R3, R3, R1, ASR #8      @ Divide by 2^8
    ADD   R3, R3, R1, ASR #9      @ Divide by 2^9
    ADD   R3, R3, R1, ASR #11     @ Divide by 2^11
    ADD   R3, R3, R1, ASR #17     @ Divide by 2^17
    ADD   R3, R3, R1, ASR #18     @ Divide by 2^18
    LDR   R0, =ret_val            @ Getting Address of Return Value
    STR   R3, [R0]                @ Store R1(result) into return value