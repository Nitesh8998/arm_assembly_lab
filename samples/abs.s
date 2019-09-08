@ ABS r1 , r2 absolute value of r2 in r1

@ BSS section
      .bss
z: .word

@ DATA SECTION
      .data
a: .word -10

@ TEXT section
      .text

.globl _main

_main:
   LDR  r3, =a    ;@get the address of a
   LDR  r2,[r3]   ;@get value of a
   CMP  r2,#0     ;@compare against 0 to get the sign
   BGE  result    ;@Branch if greater or equal to result
   RSBS r2,r2,#0

result:   
   MOV r1,r2      ;@absolute value is obtained here