
  @ BSS section
      .bss
sum: .word

  @ DATA SECTION
      .data

 a: .word 100
 b: .word 54

  @ TEXT section
      .text

.globl _main

_main:

        @ you can write your own code here
		@ Fast multiplication i.e without MUL r1 = r2*45 1 MULF r1, r2, #54
		@ MULF r1, r2, #54
		@ Note: Overflow (Carry) part is not conisdered in this program.
        LDR r4, =a
        LDR r2,[r4]
        LDR r5, =b
        LDR r3,[r5]
		MOV r7, #0
		MOV r8, #0
		
 loop:		
		CMP r3, #0
		BEQ out
		AND r9, r3, #1
		CMP r9, #1
		MOV r6, #0
		LSLEQ r6, r2, r8
		ADD r7, r7, r6
		LSR r3, r3, #1
		ADD r8, r8, #1
		b loop
 out:
         
		MOV r1, r7
		SWI 0x11