
  @ BSS section
      .bss
sum: .word

  @ DATA SECTION
      .data

 a: .word 0
 b: .word 45

  @ TEXT section
      .text

.globl _main

_main:

        @ you can write your own code here
		@ Fast division, r1 = r2/45
		@ DIV r1, r2, #45

        LDR r4, =a
        LDR r2,[r4]
        LDR r5, =b
        LDR r3,[r5]
		MOV r7, #0
		MOV r8, #32
		
 loop:		
		CMP r3, r2
		BHI out
		MOV r6, #0
		LSL r6, r3, r8
		CMP r6, r2
		BLS less
		SUB r8, r8, #1
		b loop
 less:
		
		MOV r9, #1
		CMP r6, r2
		SUB r2, r2, r6
		LSL r9, r9, r8
		SUB r8, r8, #1
		ADD r7, r7, r9 
		b loop
 out:
         
		MOV r1, r7
		SWI 0x11