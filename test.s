#Jonathan Nagel jn855420@ohio.edu 10/17/2023

.data 

strA:	.asciiz "Please enter your choice to skip numbers (1-4)\n" 

Numbers:	.word 100, -7, 11, 25, -66, 99, -1, 34, 12, 22, -2, -7, 100, 11, 4, 67, 2, -90, 22, 2, 56, 3, -89, 12, -10, 21, 10, -25, -6, 9, 111, 34, 12, 22, -2, -17, 100, 111, -4, 7, 14, -19, -2, 29, 36, 31, -79, 2 

 

.globl main 

.text 

main:

#compute the sum of N numbers such that each sum skips over values
#the values to the skipped over are determined by the user (1-4)
#Example Cases:

#Sum(x1) = N1 +N2 +N3 +...
#Sum(x2) = N1 + N3 + N5
#Sum(x3) = N1 + N4 + N7

#load prompt string and print to console
la $a0, strA
li $v0, 4
syscall

#load user input into $t0
li $v0, 5 	#read syscall
syscall
move $t0, $v0 	#move into to $t0


#initialize sum and index
li $t1, 0	#sum
li $t2, 0	#index



# Load the base address of the Numbers array into $t0
la $t0, Numbers
    
# Load the first number from the array into $t1
lw $t3, 0($t0)

add $t1, $t1, $t3

#print sum
move $a0, $t3
li $v0, 1
syscall



    
j end





end:

#print sum
move $a0, $t1
li $v0, 1
syscall 

li $v0, 10
syscall



