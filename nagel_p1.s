#Jonathan Nagel jn855420@ohio.edu 10/17/2023
.data

strA: .asciiz "Original Array:\n "

strB: .asciiz "Second Array:\n"

newline: .asciiz "\n"

space : .asciiz " "

# This is the start of the original array.

Original: .word 200, 270, 250, 100

.word 205, 230, 105, 235

.word 190, 95, 90, 205

.word 80, 205, 110, 215

# The next statement allocates room for the other array.

# The array takes up 4*16=64 bytes.

#

Second: .space 64

.align 2

.globl main

.text

main: # Your fully commented program starts here.

#need to take 4-byte elements from Original and put them into Second
#If matrix is seen as spaces 1-16, then put into second as follows
#1 5 9 13 
#2 6 10 14
#3 7 11 15
#4 8 12 16

    # Load values from Original into registers $t0 to $t15
    lw $t0, Original
    lw $t1, Original+4
    lw $t2, Original+8
    lw $t3, Original+12
    lw $t4, Original+16
    lw $t5, Original+20
    lw $t6, Original+24
    lw $t7, Original+28
    lw $t8, Original+32
    lw $t9, Original+36
    lw $s0, Original+40
    lw $s1, Original+44
    lw $s2, Original+48
    lw $s3, Original+52
    lw $s4, Original+56
    lw $s5, Original+60

# Store values from registers $t0 to $t15 into Second with an offset
    sw $t0, Second
    sw $t1, Second+16
    sw $t2, Second+32
    sw $t3, Second+48
    sw $t4, Second+4
    sw $t5, Second+20
    sw $t6, Second+36
    sw $t7, Second+52
    sw $t8, Second+8
    sw $t9, Second+24
    sw $s0, Second+40
    sw $s1, Second+56
    sw $s2, Second+12
    sw $s3, Second+28
    sw $s4, Second+44
    sw $s5, Second+60

    # Print the values from registers $t0 to $t15
    # print each one as an integer

    lw $t0, Second	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall

    la $a0, space		# print a space
    li $v0, 4
    syscall


    lw $t0, Second+4	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall

    la $a0, space		# print a space
    li $v0, 4
    syscall


    lw $t0, Second+8	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall

    la $a0, space		# print a space
    li $v0, 4
    syscall

    lw $t0, Second+12	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall

    #end first 4 elements, need newline

    la $a0, newline		# print a newline
    li $v0, 4
    syscall


    lw $t0, Second+16	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall


    la $a0, space		# print a space
    li $v0, 4
    syscall


    lw $t0, Second+20	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall

    la $a0, space		# print a space
    li $v0, 4
    syscall


    lw $t0, Second+24	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall

    la $a0, space		# print a space
    li $v0, 4
    syscall

    lw $t0, Second+28	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall

    #end 2nd 4 elements, need newline

    la $a0, newline		# print a newline
    li $v0, 4
    syscall


    lw $t0, Second+32	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall

    la $a0, space		# print a space
    li $v0, 4
    syscall


    lw $t0, Second+36	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall

    la $a0, space		# print a space
    li $v0, 4
    syscall


    lw $t0, Second+40	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall

    la $a0, space		# print a space
    li $v0, 4
    syscall

    lw $t0, Second+44	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall

    #end 3rd 4 elements, need newline

    la $a0, newline		# print a newline
    li $v0, 4
    syscall


    lw $t0, Second+48	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall


    la $a0, space		# print a space
    li $v0, 4
    syscall


    lw $t0, Second+52	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall

    la $a0, space		# print a space
    li $v0, 4
    syscall


    lw $t0, Second+56	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall

    la $a0, space		# print a space
    li $v0, 4
    syscall

    lw $t0, Second+60	#load + print word

    li $v0, 1
    move $a0, $t0
    syscall



    # Exit the program
    li $v0, 10
    syscall



