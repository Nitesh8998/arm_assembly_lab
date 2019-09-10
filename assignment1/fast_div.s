mov r9, #0x150
mov r8, #0x15
mov r5, r8
mov r7, #0
mov r6, #0
mov r4, #0
loop:
	cmp r8,r9
	bge endif
	mov r8, r8, lsl #4
	cmp r7, #0
	beq loop
endif:	
	mov r8, r8, lsr #4
	cmp r8, r5
	blt exi
loo:
	sub r9, r9, r8
	add r6, r6, #1
	cmp r9, r8
	bge loo
mov r4, r4, lsl #4
add r4, r6, r4
mov r6, #0
cmp r5, r8
blt endif
exi:
	ldr r0, =0x00000010
	str r4, [r0]	

