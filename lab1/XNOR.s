/******************************************************************************
* file: ABS.s
* Author: Pawan Bathe (CS18M519)
* TA: G S Nitesh Narayana
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*

ARM Assembly Code to simulate behavior of XNOR of input_number1 and input_number2
*/

  @ BSS section
      .bss
result: .word

  @ DATA SECTION
      .data
input_number1: .word 0xFFFFFFFF
input_number2: .word 0x00000000

  @ TEXT section
      .text

.global _main

_main:
	LDR R0, =input_number1  
 	LDR R1, [R0] 
  	LDR R2, =input_number2  
  	LDR R3, [R2] 
	EOR R4, R1, R3
	MVN	R5, R4
	LDR R6, =result
	STR R5, [R6]