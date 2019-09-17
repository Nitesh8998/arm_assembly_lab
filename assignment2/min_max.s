@###############################################################
@
@    Sivalingam Periasamy - CS18M502
@    Int - min, max arm lab 2
@
@###############################################################

.data
data_items: .word 20, 45, 66, 38, 109, 0

ldr r1, =data_items  	//r1 stores the data item
ldr r2, [r1]		//r2 stores the max, Initialize with first value of data_item
ldr r3, [r1]		//r3 stores the min, Initialize with first value of data_item
mov r4, #0 		//r4 stores the counter, Initialize with zero

prog_loop: ldr r5, [r1], #4  	//r5 stores the data_item's value
	
 @ Compare the value of r5 with zero and if r5 is equal to zero branch to end_program to terminate
 cmp r5, #0
  beq end_prog

 @ Add 1 to counter for each loop	
 add r4, #1 	 //counter increament
	
 cmp r5, r2
  bgt change_max //branch to change_max if r5>r2

 cmp r5, r3
  blt change_min //branch to change_min if r5<r3

 b prog_loop 	 //branch back to prog_loop (loop)

 change_max:
  mov r2, r5 	 //move r5 to r2
  b prog_loop 	 //branch back to prog_loop (loop)

 change_min:
  mov r3, r5	 //move r5 to r3
  b prog_loop 	 //branch back to prog_loop (loop)

//program_end
end_prog: