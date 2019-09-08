


.global _main

_main:

@XNOR r1 , r2 , r3
@r1	r2	r3		
@1	0	0
@0	0	1
@0	1	0
@1	1	1
@Logic  is :
@ r1 = (r2 and r3) or (!r2 and !r3)

@Loading some hex value to r2 and r3
LDR r2, =0xFF000000
LDR r3, =0xFF00000F

MVN r5, r2 @ bitwise logical NOT on r2 i.e r5 = !r2 
MVN r6, r3 @ bitwise logical NOT on r3 i.e r6 = !r3

AND r4, r2, r3 @Performing r4 = r2 and r3
AND r7, r5, r6  @Performing r7 = r5 and r6 or r7 = !r2 and !r3
ORR r1 ,r4, r7 @Performing r1 = r4 or r7 i.e. r1 = (r2 and r3) or (!r2 and !r3)
