.data
prompt: .asciiz "This program calculates the fibonacci sequence.\nEnter an integer number: "
result: .asciiz "F_"
result2: .asciiz " = "
endl: .asciiz "\n"
.text
main:

# Prompt user to input number
la $a0,prompt   
li $v0,4
syscall

li $v0,5    #Read n
syscall

move $t2,$v0    # n to $t2


# Call function to get fibonnacci #n
move $a0,$t2
move $v0,$t2
jal fib     #call fib (n)
move $t3,$v0    #result is in $t3

# Print the result


move $a0,$t3    #Print the answer
li $v0,1
syscall

la $a0,endl #Print '\n'
li $v0,4
syscall

# End program
li $v0,10
syscall


fib:

#base cases 0 and 1
beqz $a0,zero   #if n=0 return 0
beq $a0,1,one   #if n=1 return 1


#fib(n-1)
sub $sp,$sp,4   #push address to stack
sw $ra,0($sp)

sub $a0,$a0,1   #n-1
jal fib     
add $a0,$a0,1

lw $ra,0($sp)   #restoring return address from stack
add $sp,$sp,4


sub $sp,$sp,4   #Push return value to stack
sw $v0,0($sp)

#fib(n-2)
sub $sp,$sp,4   #storing address on stack
sw $ra,0($sp)

sub $a0,$a0,2   #n-2
jal fib     
add $a0,$a0,2

lw $ra,0($sp)   #return address from stack
add $sp,$sp,4

#---------------
lw $s7,0($sp)   #Pop from stack
add $sp,$sp,4

add $v0,$v0,$s7 # f(n - 2)+fib(n-1)


jr $ra # decrement



zero:
li $v0,0
jr $ra
one:
li $v0,1
jr $ra
