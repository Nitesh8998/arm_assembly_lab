MOV r2, #0x2
multiply: ADD r1, r1, #0x54
SUB r2, r2, #1
CMP r2, #0x0
BNE multiply
