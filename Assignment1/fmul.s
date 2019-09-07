  @ Performs fast multiplication operation - MUL r1,r2,#54

  @ BSS section
      .bss
z: .word

  @ DATA SECTION
      .data
a: .word -5234 

  @ TEXT section
      .text

.global _main

	 
_main:

     LDR r4, =a             ; @ Get the address of a
     LDR r2, [r4]           ; @ Get value of a
     MOV r3, #54            ; @ 54 = 110110 = 2^1 + 2^2 + 2^4 + 2^5
     MOV r1, r2, LSL #1     ; @ Multiply by 2^1 = 2
     ADD r1, r1, r2, LSL #2 ; @ Multiply by 2^2 = 4
     ADD r1, r1, r2, LSL #4 ; @ Multiply by 2^4 = 16
     ADD r1, r1, r2, LSL #5 ; @ Multiply by 2^5 = 32
	
     
