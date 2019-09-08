MOV r2, #0x65
CMP r2, #45
BLE out
subract :SUB r2, r2, #0x45
CMP r2, #45
ADD r1, r1, #1
BGE subract
out: