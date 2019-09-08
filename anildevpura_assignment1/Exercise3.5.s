.global _main

_main:
		
@5. ABS r1 , r2 @absolute value of r2 in r1
@ abs(-6) = 6 ==>  condition 1
@abs(6) = 6 ==> condition 2
	
_start:
	ldr r2, =-6 @Loading some 
	cmp r2,#0
	ble NEG
POS:
	MOV r1, r2 @to handle condition 2	
	b end @End of programe


NEG:
	MVN r2, r2
	Add r2, #1
	b POS
	
end:
	bx lr @For end of execution. This is needed else NEG gets re-executed