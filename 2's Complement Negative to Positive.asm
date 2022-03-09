.data
arr: .word 5, -1, 4, -3, 0
space: .asciiz " "
.text
addi $t0, $0, 0  #int i = 0
addi $t1, $0, 5  #Loop Counter (array size)
addi $t3, $0, 0  #PrintArray Counter
la $a1, arr  #arr[0] pointer
addi $t6, $a1,0 #temporary for print

Loop:  beq $t0, $t1, LoadArray
lw $t2, 0($a1)  #Loading our array's first integer to temporary holder
xori $t5, $t2, 0xFFFFFFFF  #Finding inverse of our integers for 2's complement
addi $t5, $t5, 1  #Adding 1 to complete 2's complement
sw $t5, 0($a1)
addi $a1, $a1, 4  #We need to shift our arr[0] pointer 4 address for 4 bits of value
addi $t0, $t0, 1  #i++ 
j Loop

LoadArray: la $a1, arr  #Loading our a1 to our 2's complemented array's first integers address
j PrintArray

PrintArray: beq $t3, $t1, exit
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
#Output:  -5 1 -4 3 0
