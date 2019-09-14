.EQU SWI_STOP, 0x11

.DATA
data_items: .word 10, 4, 28, 100, 8, 0

.TEXT
.global _MAIN

_MAIN:
    MOV R0, #0          @ R0 is used to count number of digits
    MOV R1, #0          @ R1 is used to hold maximum among numbers
    MOV R2, #-1         @ R2 is used to hold minimum among numbers
    LDR R5, =data_items @ R5 is loaded with begin of data segment starting address
_LOOP:
    LDR R4, [R5], #4    @ R5 memory contents is moved to R4 and R5 is incremented to next word
    CMP R4, #0          @ Compare R4 with 0 to check whether it is terminating word
    BEQ _EXIT           @ If Z flag is set goto _EXIT label
    ADD R0, #1          @ Else add #1 to R0 for count increment
    CMP R1, R4          @ Compare contents of R1 and R4 concentrating on C flag
    MOVCC R1, R4        @ Moving content of R4 to R1 if C flag is clear (borrow) which mean R4 is greater
    CMP R2, R4          @ Compare contents of R2 and R4 concentrating on C flag
    MOVCS R2, R4        @ Moving content of R4 to R1 if C flag is set (no borrow) which mean R4 is lesser or equal
    B _LOOP             @ Branch to loop with unconditional branch
_EXIT:
    SWI SWI_STOP        @ Halt the program execution