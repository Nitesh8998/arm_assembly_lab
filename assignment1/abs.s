 
 /******************************************************************************
 * file: abs.s
 * description: brief sample program for ARM SIM
 * author: Pravir
 * Guide: Prof. Madhumutyam IITM, PACE
 ******************************************************************************/
 
 /*
 
ABS r1, r2;
 */
 
 @ BSS section
 .bss
 z: .word
 
 @ DATA SECTION
 .data
  a: .word -55
 //b: .word 5124
 
 @ TEXT section
 .text
 
 .globl	_main
 
 
 _main:
LDR R4, =a   ; //get the address of a
LDR R2, [R4] ; //get value of a
ASR R0, R2, #31; //R0<-(a >= 0) ? 0 : -1, i.e. signed bit
ADD R1, R0, R2; //R1 <- R0 + R2, get 1's complement for -ve number, for +ve number R0 is 0, so R1 = R2
EOR R1, R1, R0; //R1 <- R1 ^ R0, bit flip 1's complement as for -ve number R0 is all Fs, for +ve number R0 is 0, XOR with 0, R1 will not change

