MIPS Code: 

.data
arr: .word 8, 1, 4, 5, 6, 3, 2, 9, 7, 0
BlankSpace: .asciiz " "
.text
addi $t0, $0, 1  #int i = 0 
addi $t1, $0, 1  #int j = 0 
addi $t2, $0, 10  #array_size 
la $a1,arr  #arr[0] pointer
add $t6, $a1, $0 

FirstLoop: 
beq $t0, $t2, PrintArray 
addi $t0, $t0, 1  #i++ 
beq $t1, $t2, ResetJ

SecondLoop: 
beq $t1, $t2, FirstLoop  #SecondLoop Returns to first loop after it finishes first set   
lw $t3, 0($a1)          
addi $a2, $a1, 4
lw $t4, 0($a2)
sgt $t5, $t3, $t4  #if(arr[i]>arr[j], t5 will be 1
beq $t5, 1, Swap
addi $a1, $a1, 4  #We need to shift our arr[0] pointer 4 address for 4 bits of value
addi $t1, $t1, 1
j SecondLoop

Swap: 
lw $t4, 0($a2)
lw $t3, 0($a1)
sw $t4, 0($a1)
sw $t3, 0($a2)
addi $a1, $a1, 4  #We need to shift our arr[0] pointer 4 address for 4 bits of value
addi $t1, $t1, 1  #We need to increment j(j++) after swap like we did in C code
j SecondLoop

ResetJ:  #We need to reset J after every time SecondLoop's cycle ends
addi $t1, $0, 1 
add $a1, $t6, $0 
j SecondLoop          

PrintArray:
li $v0, 1
lw $a0, 0($t6)
syscall
li $v0, 4
la $a0, BlankSpace
syscall
addi $t6, $t6, 4           
addi $t7, $t7, 1                  
bne $t7, 10, PrintArray

#Output: 0 1 2 3 4 5 6 7 8 9

