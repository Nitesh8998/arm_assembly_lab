MOV R2,#100
MOV R1,#0
loop:
	 SUB R2,R2,#45
	 ADD R1,#1	
check:
	CMP R2,#45
	BGE loop