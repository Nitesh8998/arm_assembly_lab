@============================================================================
@ *lab2_1.s*
@ Description: An assembly program to compute the maximum and minimum values
@              in a given set of non-zero unsigned integer numbers.
@============================================================================
@============================================================================
@
@ EDIT HISTORY FOR MODULE
@
@ $Header: $
@
@ when          who                    what, where, why
@ -----------   -------------------    --------------------------
@ 17 Sep 2019    Swapneel Pimparkar     (Bengaluru) First Draft
@============================================================================

@------------------------------------------------------------------------------
@ Logic: (1) Initialize two registers with first value read from set.
@            First register will be used for maximum & second for minimum. 
@            Because it is set, the values will not be repeated.
@            This will also help because if the data set contains only one
@            non-zero value then that value is min & max both.  
@        (2) Also initialize third register with 0. This will be count.
@        (3) Read the next value from set.
@        (4) Compare with zero. If true terminate else increment value in 
@            third register (i.e. count) and then proceed.
@        (5) Compare newly read value with first register. If greater then
@            replace contents of first register else proceed.
@        (6) Compare new read value with second register. If lower then 
@            replace contents of second register else proceed.
@        (7) As we are here, it means the read value was neither max or min
@            from the set of values read so far. Do nothing with value. Just
@            proceed to read next value from set i.e. goto step (3) above.
@------------------------------------------------------------------------------

.global _END
.global _LOOP
.global _START
.global _IF_SMALLER
.global _IF_GREATER
.global _PROG_DATA

.text

@ Program starts here

_START:
@ LOAD THE DATA ADDRESS 
    LDR    R6, _PROG_DATA
    
@ READ THE FIRST VALUE   
    LDR    R4, [R6, #4]!
    
@ R0 IS COUNT. BECAUSE WE HAVE ALREADY READ FIRST VALUE
@   INITIALIZE IT WITH 1. 
   
    MOV    R0, #1
    
@MAX IS STORED IN R1
    MOV R1, R4
    
@MIN IS STORED IN R2
    MOV R2, R4

@ BRANCH TO _LOOP    
    B    _LOOP
    
_IF_GREATER:
    MOV    R1, R4
    B    _LOOP
    
_IF_SMALLER:
    MOV    R2, R4
    
_LOOP:
@READ NEXT VALUE
    LDR    R4, [R6, #4]!

@COMPARE IT WITH ZERO (END MARKER)    
    CMP    R4, #0

@IF READ VALUE IS ZERO - GOTO END.    
    BEQ    _END
    
@INCREMENT R0    
    ADD  R0,R0,#1

@COMPARE READ VALUE WITH MAX     
    CMP    R4, R1
    
@IF READ VALUE IS GREATER, BRANCH TO _IF_GREATER    
    BGT    _IF_GREATER

@COMPARE READ VALUE WITH MIN    
    CMP    R4, R2
    
@IF READ VALUE IS SMALLER, BRANCH TO _IF_SMALLER
    BLT    _IF_SMALLER
    
@ELSE LOOP AGAIN TO READ NEXT VALUE    
    B    _LOOP



_PROG_DATA:
@ Allocate 4 bytes to hold the address of data being used.
    .word    .LANCHOR0-4
    .global    arr
    .data
    .set    .LANCHOR0,. + 0
    .type    arr, %object
arr:
    .word    45
    .word    67
    .word    89
    .word    3
    .word    6
    .word    1
    .word    92
    .word    0
    
_END:
.end

