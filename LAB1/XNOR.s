  @ BSS section
      .bss
z: .word
  @ DATA SECTION
      .data
a: .word 1245

b: .word 0



  @ TEXT section

      .text

.global _main


_main:

     LDR r4, =a   ; @get the address of a
     LDR r2, [r4] ; @get value of a

     LDR r4, =b; @get the address of b
     LDR r3, [r4] ; @get value b

     EOR r1, r2,r3	
     MVN r1, r1;@result is stored in r1



    

   