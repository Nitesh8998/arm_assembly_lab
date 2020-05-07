@ DIV r1,r2,#45 Perform fast division

@ BSS section
      .bss
z: .word

@ DATA SECTION
      .data
a: .word 180 

@ TEXT section
      .text

.globl _main

_main:

    LDR r3, =a     ; @ get the address of a
    LDR r2, [r3]   ; @ get value of a i.e the dividend
    MOV r4, #45    ; @ load divisor
    MOV r5, #0     ; @ reset the register to hold the quotient
	
repeat:
	SUB r2, r2, r4
	ADD r5, #1	
	CMP r2, r4
	BGE repeat
end:
	MOV r1,r5
	
