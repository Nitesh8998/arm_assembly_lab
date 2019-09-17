.data
data_items: .word 10, 4, 28, 100, 8, 0

LDR R1, =data_items
LDR R4, [R1] // Min Element
LDR R5, [R1] // Max Element
loop: LDR R2, [R1], #4
CMP R2, #0
BEQ done
ADD R3, R3, #1 // Count
CMP R2, R4
BLE new_min
CMP R2, R5
BGE new_max
B loop
new_min: MOV R4, R2
B loop
new_max: MOV R5, R2
B loop
done: