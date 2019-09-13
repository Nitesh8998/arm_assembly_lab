  @ BSS section
      .bss
i: .word

  @ DATA SECTION
      .data
a: .word 10,4,28,100,8,0

  @ TEXT section
      .text

.globl _main

_main:
        LDR r0, =a ; //address of a
		ldr r9,[r0];	//register to store maximum
		ldr r8,[r0];	//register to store minimum
		
loop:   LDR r1, [r0],#4 ; //content of r0 loaded in to r1 and post increment
		cmp r1,#0
		beq endl
		cmp r1, r9
		ble cont1		
		mov r9,r1
		
cont1:	cmp r1,r8
		bge cont2
		mov r8, r1
		
cont2:	cmp r0,r0
		ble loop
		
endl:	ldr r0, =0x00000010
		str r9, [r0]

