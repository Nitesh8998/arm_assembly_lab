.global _main

_main:

@3. Fast multiplication i.e without MUL r1 = r2*54
@Loading some hex value to r2 and given value to r3
	LDR r2, =0xFFFF
	LDR r3, =0x36 @54 in decimaal 
	MOV r1, #0 @result, hence initialized it with 0
	MLoop:
		add r1,r2 @Adding r2 to r1
		subs r3,#1 @decrimantin r3, i.e. it's a counter of how many time r2 needs to be added in r1
		bne MLoop @branch not equal i.e. MLoop will be called id r2 is not zero