 
 /******************************************************************************
 * file: XNOR_ANDN.s
 * description: brief sample program for ARM SIM
 * author: Pravir
 * Guide: Prof. Madhumutyam IITM, PACE
 ******************************************************************************/
 
 /*
 
XNOR r1, r2, r3;
 */
 
 @ BSS section
 .bss
 z: .word
 
 @ DATA SECTION
 .data
  a: .word 55
  b: .word 5124
 
 @ TEXT section
 .text
 
 .globl	_main
 
 
 _main:

LDR r4, =a   ; //get the address of a
LDR r2, [r4] ; //get value of a

LDR r4, =b   ; //get the address of b
LDR r3, [r4] ; //get value of b

/* XNOR r1, r2, r3 */
 EOR r4,r2,r3; //r4=r2 XOR r3
 MVN r1, r4; //r1 = ~r4

/* r1 = r2 AND ~r3*/
 MVN r4, r3;//r4=~r3
 AND r1, r2, r4;//r1=r2 AND r4
