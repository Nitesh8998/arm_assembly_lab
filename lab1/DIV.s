/******************************************************************************
* file: DIV.s
* Author: Pawan Bathe (CS18M519)
* TA: G S Nitesh Narayana
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
ARM Assembly Code to simulate behavior of Division instruction, DIV of two numbers,
 input_number1 and input_number2
*/

  @ BSS section
      .bss
result: .word

  @ DATA SECTION
      .data
dividend: .word 200
divisor: .word 20

  @ TEXT section
      .text

.global _main

_main:
  LDR R0, =dividend  
  LDR R1, [R0] 
  LDR R2, =divisor  
  LDR R3, [R2] 
  MOV R4, #0 

CMP R1, R3
BMI smaller_divisor

loop:
  ADD R4, R4, #1
  SUBS R1, R1, R3
  BMI adjust_quotient
  B loop

smaller_divisor:
  MOV R4, #0
  B end

adjust_quotient:
  SUB R4, R4, #1

end:
  LDR R5, =result
  STR R4, [R5]
