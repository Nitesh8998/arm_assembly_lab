  @ BSS section
      .bss
z: .word
  @ DATA SECTION
      .data
a: .word 32423

b: .word 122

c: .word 0

  @ TEXT section

      .text

.global _main


_main:

     LDR r4, =a   ; @get the address of a
     LDR r2, [r4] ; @get value of a

     LDR r4, =b; @get the address of b
     LDR r3, [r4] ; @get value b

     LDR r4, =c; @get the address of c
     LDR r1, [r4] ; @get value c
     
.L4:
        cmp     r3, #0
        beq     .L5
        and     r4, r3, #1
        cmp     r4, #0
        beq     .L3
        add     r1, r1, r2

.L3:
        lsl     r2, r2, #1
        asr     r3, r3, #1
        b       .L4
.L5:
	LDR r4, =c   ; @get the address of c
	str  r1,[r4] ; @result is stored in c