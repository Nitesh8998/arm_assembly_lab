/******************************************************************************
* file: MULF.s
* Author: Pawan Bathe (CS18M519)
* TA: G S Nitesh Narayana
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
ARM Assembly Code to simulate behavior of Fast multiplication instruction, FMUL of two numbers,
input_number1 and input_number2
*/

  @ BSS section
      .bss
result: .word

  @ DATA SECTION
      .data
input_number1: .word 8
input_number2: .word -9

  @ TEXT section
      .text

.global _main

_main:
  LDR R0, =input_number1  
  LDR R1, [R0] 
  LDR R2, =input_number2  
  LDR R3, [R2]
  MOV R2, #0 

  CMP R3, #0
  BMI loop_negative

loop_positive:
  ADD R2, R2, R1
  SUBS R3, R3, #1
  BNE loop_positive
  LDR R4, =result
  STR R2, [R4]
  B exit_positive_loop

loop_negative:
  ADD R2, R2, R1
  ADDS R3, R3, #1
  BNE loop_negative
  RSB R2, R2, #0
  LDR R4, =result
  STR R2, [R4]

exit_positive_loop:

