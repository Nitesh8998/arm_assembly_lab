/******************************************************************************
* file: ABS.s
* Author: Pawan Bathe (CS18M519)
* TA: G S Nitesh Narayana
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
ARM Assembly Code to simulate behavior of ABS value of input_number
*/

  @ BSS section
      .bss
result: .word

  @ DATA SECTION
      .data
input_number: .word -45

  @ TEXT section
      .text

.global _main

_main:
  LDR R0, =input_number   
  LDR R1, [R0] 
  CMP   R1, #0
  RSBMI R1, R1, #0
  LDR R2, =result
  STR R1, [R2]


