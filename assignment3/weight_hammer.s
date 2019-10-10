  @ BSS section
      .bss


  @ DATA SECTION
      .data
data_start: .4byte 0x205A15E3, 0x256C8700, 0x295468F2 ;
data_end: .4byte 0x295468F2 ;
a: .4byte 0x55555555, 0x33333333, 0x0f0f0f0f, 0x00ff00ff, 0x0000ffff ;
weight: .word 0x0;
num: .4byte 0x0;


  @ TEXT section
      .text

.globl _main

_main:
			ldr r0, =data_start ; 	//address of data_start loaded in r0
			mov r4, #0				// to store the max weighed number
loop3:			ldr r1, [r0], #4		// load number to be checked in r1
			mov r5, r1
			ldr r8, =a				// address of a loaded in r2
			mov r9, #1
			mov r7, #2
			
loop1:			ldr r2, [r8], #4		// load number that has to be and'ed in r2
			and r3, r2, r1			// and number, a
			and r2, r1, lsr r9		// and number >> 2^m, a
			add r1, r2, r3			// add outputs of and operations
			mul r6, r9, r7			// calculate 2 powers for shift right operation
			mov r9, r6				// moving muliplier out put to r9 as r9 is used in shift operation
			cmp r9, #16				// if r9 = 16 indicates end of computation
			ble loop1				// if not branch to start of and-ing
			cmp r1, r4				// comparing r1 to r4
			ble loop2				// if no branch to rest
			mov r4, r1				// else store r1 to r4 as r1 is currently the max-weighed
			ldr r6, =num
			str r5, [r6]
			
loop2:			ldr r1, =data_end	// loading data_end to check if we have come to end of list to be computed
			ldr r2, [r1]
			cmp r2, r5				// comparing to end list
			bne loop3				// if not end then branch to start
			ldr r1, =weight
			str r4, [r1]
			
			