.global _main

_main:

@2. Bit-wise and of r2 and !r3 (compliment of r3)
@r1 = r2 and !r3

@Loading some hex value to r2 and r3
	LDR r2, =0xFF000000
	LDR r3, =0xF0000000
	
	MVN r3, r3 @ bitwise logical NOT on r3 i.e r3 = !r3 
	and r1, r2, r3 @ r1 = r2 and !r3 (as r3 is updated tp !r3 in privious step) 


@Otherway of doing same thing
	LDR r2, =0xFF000000
	LDR r3, =0xF0000000	
	
	@ Increasing 1 ang taking neg to convert r3 to !r3
	add r3, #1
	neg r3, r3	

	and r1, r2, r3 @ r1 = r2 and !r3 (as r3 is updated to !r3) 