@ DATA SECTION
      .data
a: .word 0x6cba ;

mov r1, #9
mov r2, #10
ldr r0, =a
ldr r3, [r0]
