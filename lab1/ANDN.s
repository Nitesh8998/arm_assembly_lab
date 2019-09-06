/******************************************************************************
* file: ANDN.s
* Author: Pawan Bathe (CS18M519)
* TA: G S Nitesh Narayana
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
ARM Assembly Code to simulate behavior of ANDN instruction, bitwise AND of input_number1 and !input_number2
*/

  @ BSS section
      .bss
result: .word

  @ DATA SECTION
      .data
input_number1: .word 0xFFFFFFFF
input_number2: .word 0xFFFFFFFF

  @ TEXT section
      .text

.global _main

_main:
  LDR R0, =input_number1  
  LDR R1, [R0] 
  LDR R2, =input_number2  
  LDR R3, [R2] 
  BIC R4, R1, R3
  LDR R5, =result
  STR R4, [R5]
