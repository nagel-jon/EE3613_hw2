.data

strA: .asciiz "Original Array:\n "

strB: .asciiz "Second Array:\n"

newline: .asciiz "\n"

space : .asciiz ""

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

lw $t0, Original #load first word of Original into $t0

sw $t0, Second #store first word of Original into Second

lw $t0, 4($s0) #load second word of Original into $t0

li $t1, 16 #load 16 into $t1 (offset for next word)
sll $t1, $t1, 2 #multiply $t1 by 4 to get offset for next word




li $v0, 1
lw $a0, Second
syscall



li $v0, 10	# exit
syscall
