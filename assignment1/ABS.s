MOV r2, #0x0
CMP r2, #0x0
BGE positive
EOR r2, r2, #0xff
ADD r2, r2, #0x1
AND r2, #0xff
positive :MOV r1, r2