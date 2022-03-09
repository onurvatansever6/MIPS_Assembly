.data
arr1: .word 3, 1, 2, 5, 8
arr2: .word 2, 0, 4, 6, 7
arr3: .space 20
space: .asciiz " "
.text
addi $t0, $0, 0  #int i = 0
addi $t1, $0, 5  #Loop Counter (array size)
addi $t2, $0, 0  #PrintArray Counter
la $a1, arr1  #arr[0] pointer for arr1
la $a2, arr2  #arr[0] pointer for arr2
la $a3, arr3  #arr[0] pointer for arr3
addi $t6, $a3,0 #temporary for print

Loop: beq $t0, $t1, PrintArray
lw $t3, 0($a1)  #Loading our arr1's first integer to temporary holder
lw $t4, 0($a2)  #Loading our arr2's first integer to temporary holder
lw $t5, 0($a3)  #Loading our arr3's first integer to temporary holder
mul $t5, $t3, $t4  #Multiplying our temps
sw $t5, 0($a3)  #Storing multiplied values on arr3
addi $a1, $a1, 4  #We need to shift our arr1[0] pointer 4 address for 4 bits of value
addi $a2, $a2, 4  #We need to shift our arr2[0] pointer 4 address for 4 bits of value
addi $a3, $a3, 4  #We need to shift our arr3[0] pointer 4 address for 4 bits of value
addi $t0, $t0, 1  #i++ 
j Loop

PrintArray: beq $t2, $t1, exit
addi $t2, $t2, 1
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

# Output: 6 0 8 30 56
