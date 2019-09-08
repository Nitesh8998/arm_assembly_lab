@ Fast multiplication i.e without MUL r1 = r2*45, MULF r1 , r2 , #54

@ BSS section
      .bss
z: .word

  @ DATA SECTION
      .data
a: .word 52 

  @ TEXT section
      .text

.globl _main


_main:

     LDR r3, =a  		    ; @ load addr of a
     LDR r2, [r3] 			; @ load value of a
     MOV r3, #54  			; @ mov value 54 to r3, 54 => 0x00110110 =>(2^5) + (2^4) + (2^2) + (2^1) , Bits 5,4,2,1 are set
     MOV r1, r2, LSL #5 	
     ADD r1, r1, r2, LSL #4 
     ADD r1, r1, r2, LSL #2 
     ADD r1, r1, r2, LSL #1