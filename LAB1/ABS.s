@ BSS section
      .bss
z: .word
  @ DATA SECTION
      .data
a: .word -123

  @ TEXT section
      .text

.global _main

_main:

     LDR r4, =a   ; @get the address of a
     LDR r2, [r4] ; @get value of a

     cmp     r2, #0;
     rsblt   r1, r2, #0;@result is stored in r1
      

   