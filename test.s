#Jonathan Nagel jn855420@ohio.edu 10/17/2023

.data 

strA:	.asciiz "Please enter your choice to skip numbers (1-4)\n" 

Numbers:	.word 100, -7, 11, 25, -66, 99, -1, 34, 12, 22, -2, -7, 100, 11, 4, 67, 2, -90, 22, 2, 56, 3, -89, 12, -10, 21, 10, -25, -6, 9, 111, 34, 12, 22, -2, -17, 100, 111, -4, 7, 14, -19, -2, 29, 36, 31, -79, 2 

counter: .word 50


.globl main 

.text 



#compute the sum of N numbers such that each sum skips over values
#the values to the skipped over are determined by the user (1-4)
#Example Cases:

#Sum(x1) = N1 +N2 +N3 +...
#Sum(x2) = N1 + N3 + N5
#Sum(x3) = N1 + N4 + N7

main:
    # Load the prompt string and print it to the console
    la $a0, strA
    li $v0, 4
    syscall

    # Read user input into $t0
    li $v0, 5
    syscall
    move $t0, $v0

    # Initialize sum and index
    li $t1, 0 # sum
    lw $t0, counter # load counter to $t0

    li $t3, 0 # index

li $t5, 4
li $t6, 8
li $t7, 12
li $t8, 16

    # Loop through the Numbers array

beq $t0, 1, loop1
beq $t0, 2, loop2
beq $t0, 3, loop3
beq $t0, 4, loop4

loop1:
    # Exit loop if index = 50

    # Load a word from the Numbers array
    lw $t2, Numbers($t3)


    add $t1, $t1, $t2 # add to sum
    addi $t0, $t0, -1 # decrement counter
    add $t3, $t3, $t5 # increment index
    bnez $t0, loop1

loop2:
    # Exit loop if index = 50
    lw $t2, Numbers($t3)


    add $t1, $t1, $t2 # add to sum
    addi $t0, $t0, -1 # decrement counter
    add $t3, $t3, $t5 # increment index
    bnez $t0, loop1
loop3:
    # Exit loop if index = 50
    beqz $t0, done	

    # Load a word from the Numbers array
    lw $t2, Numbers($t3)

    add $t1, $t1, $t2 # add to sum



    addi $t0, $t0, -3 # decrement counter

    add $t3, $t3, $t7 # increment index
j loop3
loop4:
    # Exit loop if index = 50
    beqz $t0, done	

    # Load a word from the Numbers array
    lw $t2, Numbers($t3)

    add $t1, $t1, $t2 # add to sum



    addi $t0, $t0, -4 # decrement counter

    add $t3, $t3, $t8 # increment index
j loop4

done:


    # Print the sum
    li $v0, 1
    move $a0, $t1
    syscall

    # Exit the program
    li $v0, 10
    syscall

