@============================================================================
@ *lab3.s*
@ Description: An assembly program to compute the weight of a 32bit binary
@              string stored at an address. i.e. to count number of bits set.
@              Also, compute such weights for series of strings stored in a 
@              range of memory addresses and report maximum weight & address.
@============================================================================
@============================================================================
@
@ EDIT HISTORY FOR MODULE
@
@ $Header: $
@ Guide: Prof. Madhumutyam IITM, PACE
@
@ when          who                    what, where, why
@ -----------   -------------------    --------------------------
@ 13 Oct 2019    Swapneel Pimparkar     (Bengaluru) First Draft
@============================================================================

@------------------------------------------------------------------------------
@ There are multiple ways with which the maximum weight can be calculated.
@ This is essentially hamming weight or population count.
@ Option 1 - Use Brian Kernighan Algorithm (n = n & (n-1))
@ Option 2 - Keep shifting left and check the msb. If 1 then increase the count.
@ Option 3 - Use Neon SIMD (vector) instructions.
@ Option 4 - Using lookup tables.
@ Option 5 - Using 64 bit instructions.
@ Option 6 - Counting bits set in parallel.
@ Logic: 
@------------------------------------------------------------------------------


.global _LOOP
.global _LOOP_OUTER
.global _START
.global _END
.global _FINAL_UPDATE
.global DATA_START
.global DATA_END
.global WEIGHT
.global NUM

@ Following is the data section.
@ Data is placed from DATA_START to DATA_END

.data
    DATA_START: .word 0x81000000
                .word 0x7156789B
                .word 0x645890FF
                .word 0x37F6F5FA
    DATA_END:   .word 0x5100000A

    NUM:        .word 0x0
    WEIGHT:     .word 0x0

.text
@ Program starts here

_START:

@ Read the data start address
    MOV R0, #0    @ Here we will store max weight globally.
    MOV R1, #0

    LDR R3, =DATA_START
    LDR R4, =DATA_END

    LDR R6, =WEIGHT

@ Let us get the total count of 32 bit data.
    SUB R3, R3, #4
    SUB R9, R4, R3
    MOV R9, R9, LSR#2

@ R9 Contains the data count. We will loop through 
@ R9 times so that we cover all the data items in memory.

_LOOP_OUTER:

    ADD R3, #4      @ This is to point to next data item in data list.
    LDR R1, [R3]    @ Get the data into R1 for processing.
    MOV R7, #0      @ R7 will be used to store count locally for data item 
                    @ being considered.

@ We are using Algorithm from Brian Kernighan (n = n & (n-1)) while n <> 0

_LOOP:
    SUB     R8, R1, #1
    ANDS    R1, R1, R8
    ADD     R7, R7, #1
    BNE     _LOOP

@ Compare local weight computed just now with global max weight.
    CMP R7, R0

@ If R7 is greater than R0 then we must update the global max weight.
    BGT _UPDATE_MAX

@ Otherwise, prepare for next iteration of loop.
    SUB R9, R9, #1
    CMP R9, #0
    BNE _LOOP_OUTER

@ If no more data items to be considered, update finally.
    B _FINAL_UPDATE

@ Update the max weight here.
_UPDATE_MAX:
    MOV R0, R7
    LDR R5, [R3]

@ prepare for next iteration of loop for data item.
    SUB R9, R9, #1
    CMP R9, #0
    BNE _LOOP_OUTER

@ Update the final data.
_FINAL_UPDATE:

    STR R0, [R6]
    MOV R1, R5
    LDR R5, =NUM
    STR R1, [R5]


@ Program ends here    
_END:
.end

