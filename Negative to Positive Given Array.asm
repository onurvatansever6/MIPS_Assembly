.data
arr: .word 5, -1, 4, -6, 0, 8, -3, 7
arr2: .space 20
space: .asciiz " "
.text
addi $t0, $0, 0  #int i = 0
addi $t1, $0, 8  #Loop Counter (array size)
addi $t2, $0, 5  #Print Counter 
addi $t3, $0, 0  #PrintArray Counter
la $a1, arr  #arr[0] pointer
la $a2, arr2  #arr2[0] pointer 
addi $t6, $a2, 0  

Loop: beq $t0,$t1,PrintArray
lw $t5, 0($a1)
addi $a1, $a1, 4  #We need to shift our arr[0] pointer 4 address for 4 bits of value
addi $t0, $t0, 1  #i++ 
bltz $t5, Loop
sw $t5,0($a2)
addi $a2, $a2, 4  #We need to shift our arr[0] pointer 4 address for 4 bits of value
j Loop

PrintArray: beq $t3, $t2, exit
addi $t3, $t3, 1
li $v0, 1  #Printing our array
lw $a0, 0($t6)
syscall
li $v0, 4  #Printing space
la $a0, space  
syscall
addi $t6, $t6, 4  #We need to shift our arr[0] pointer 4 address for 4 bits of value
j PrintArray

exit: li $v0, 10
syscall
#Output: 5 4 0 8 7
