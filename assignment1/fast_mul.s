mov r9, #50
mov r8, #45
mov r7, #0x0000000f

mov r5, #0
mov r4, #0 //for final product
mov r3, #0 //left shift counter
mov r1, #0 //partial sum
and r0, r8, r7

loop:
	cmp r0, #0
	beq endif
	add r1, r1, r9
	sub r0, r0 , #1
	cmp r5, #0
	beq loop
endif:
	add r4, r1, lsl r3
	add r3, r3, #4
	mov r8, r8, lsr #4
	and r0, r8, r7
	mov r1, #0 //partial sum
loope:
	cmp r0, #0
	beq endiff
	add r1, r1, r9
	sub r0, r0 , #1
	cmp r5, #0
	beq loope
endiff:
	//mov r1, r1, lsl r3
	add r4, r4, r1, lsl r3
