 
 /******************************************************************************
 * file: fast_div.s
 * description: brief sample program for ARM SIM
 * author: Pravir
 * Guide: Prof. Madhumutyam IITM, PACE
 ******************************************************************************/
 
 /*
 
DIV r1, r2, #45;
 */
 
 @ BSS section
 .bss
 z: .word
 @ DATA SECTION
 .data
  a: .word 1000
  MULCOS: .word 0xB60C
 
 @ TEXT section
 .text
 
 .globl	_main
 
 
 _main:
LDR R4, =a   ; //get the address of a
LDR R2, [R4] ; //get value of a

// 1/45 =0.0000010110110000011
//Left shift by 5 bits = 10110110000011
//add 00 as least significant bits  to make is 16 bits -  0xB60C‬
//MULCOS 0xB60C
//ASR #21 bits‬

LDR R4, =MULCOS   ; //get the address of MULCOS
LDR R3, [R4] ; //get value of MULCOS

MUL R1, R2, R3; //R1=R2*MULCOS

ASR R1, #21; //R1=R1>>21
