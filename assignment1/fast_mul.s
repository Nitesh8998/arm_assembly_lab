 
 /******************************************************************************
 * file: fast_mul.s
 * description: brief sample program for ARM SIM
 * author: Pravir
 * Guide: Prof. Madhumutyam IITM, PACE
 ******************************************************************************/
 
 /*
 
MUL r1, r2, #45;
 */
 
 @ BSS section
 .bss
 z: .word
 
 @ DATA SECTION
 .data
  a: .word 55
 //b: .word 5124
 
 @ TEXT section
 .text
 
 .globl	_main
 
 
 _main:
LDR R4, =a   ; //get the address of a
LDR R2, [R4] ; //get value of a

//45*r2 = 9*5*r2 = (8+1)(4+1)r2
LSL R1, R2, #3; //R1= R2*8
ADD R1, R1, R2; //R1= R1+R2 = 9*R2
LSL R2, R1, #2; //R2=R1*4=36*R2
ADD R1, R2, R1; //R1= R2+R1=45*R2

