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


loop:
#check if index (t2) is less than Numbers Length (52 bytes)
li $t3, 52
beq $t2, $t3, end

#check user input is valid choice (1-4)
beq $t0, 1, skip1
beq $t0, 2, skip2
beq $t0, 3, skip3
beq $t0, 4, skip4
j end


#N1+ N2 + N3 +...
skip1:
lw $t4, Numbers($t2)
add $t1, $t1, $t4
j increment






skip2:
skip3:
skip4:

increment:
#move to next byte in Numbers
addi $t2, $t2, 4
j loop

increment2:


increment3:


increment4:



end:

#print sum
move $a0, $t1
li $v0, 1
syscall 

li $v0, 10
syscall



