  @ Performs division by repeated subtraction operation - DIV r1,r2,r3
  @ This method is accurate but inefficient when the difference between the numbers is large	 
  
  @ BSS section
      .bss
z: .word

  @ DATA SECTION
      .data
a: .word 5234 
b: .word 45

  @ TEXT section
      .text

.global _main

	 
_main:

      LDR r4, =a     ; @ Get the address of a
      LDR r2, [r4]   ; @ Load value of dividend into regiser r2
      LDR r4, =b     ; @ Get the address of b
      LDR r3, [r4]   ; @ Load value of divisor into register r3
      MOV r1, #0     ; @ Initialize quotient to 0
	 
loop: MOV r0, r2     ; @ Update remainder
      ADD r1, r1, #1 ; @ Increment quotient
      SUBS r2, r2, r3; @ Subtract divisor from dividend and update CPSR
      BPL loop       ; @ Branch if negative flag is set
	
      SUB r1, r1, #1 ; @ Decrement quotient by 1(updated one extra time before exiting the loop)	     