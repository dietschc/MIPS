 .data    
    value1:.asciiz "Enter the first number: "
    value2:.asciiz "Enter the second number: "
    menu:.asciiz "Enter the number to choose an operation: 1 => add, 2 => subtract, 3 => multiply, 4 => divide: "
    resultText:.asciiz "Your final result is: "
    end_msg:.asciiz "Thank you for playing MathQuiz"
    newline:.asciiz "\n"
    
.text
.globl main
main:
   # Setup temp registers with values that correspond to operations
   li $t3, 1
   li $t4, 2
   li $t5, 3
   li $t6, 4
    
   # Request user input for first number
   li $v0, 4
   la $a0, value1
   syscall
    
   # Copy user input for first value to temp register
   li $v0, 5
   syscall
   move $t0, $v0
    
   # Request user input for second value
   li $v0, 4
   la $a0, value2
   syscall
    
   # Copy user input for second value to temp register
   li $v0, 5
   syscall
   move $t1, $v0
   
   # Print menu to determine operation to run
   li $v0, 4
   la $a0, menu
   syscall
    
   # Copy user input into temp register 2, used to determind which function to branch
   li $v0, 5
   syscall
   move $t2, $v0
    
   # Branch here
   beq $t2, $t3, addBlock
   beq $t2, $t4, subtractBlock
   beq $t2, $t5, multiplyBlock
   beq $t2, $t6, divideBlock
    
addBlock:
   # Perform addition calculation and store value into temp register 7
   add $t7, $t0, $t1
   
   # Print result message
   li $v0, 4
   la $a0, resultText
   syscall
    
   # Print addition calculation result
   li $v0, 1
   la $a0, ($t7)
   syscall

   # Jump to exit function
 	j exit
    
subtractBlock:
   # Perform subtraction calculation and store value into temp register 7
   sub $t7, $t0, $t1

   # Print result message
   li $v0, 4
   la $a0, resultText
   syscall
    
   # Print subtraction calculation result
   li $v0, 1
   la $a0, ($t7)
   syscall
    
   # Jump to exit function
 	j exit
    
multiplyBlock:
   # Perform multiplication calculation and store value into temp register 7
   mul $t7, $t0, $t1

   # Print result message
   li $v0, 4
   la $a0, resultText
   syscall
    
   # Print multiplication calculation result
   li $v0, 1
   la $a0, ($t7)
   syscall
    
   # Jump to exit function
 	j exit

divideBlock:
   # Perform division calculation and store value into temp register 7
   div $t7, $t0, $t1

   # Print result message
   li $v0, 4
   la $a0, resultText
   syscall
    
   # Print addition calculation result
   li $v0, 1
   la $a0, ($t7)
   syscall
    
   # Jump to exit function
 	j exit
    
exit:
   # Print newline
   li $v0, 4
 	la $a0, newline
 	syscall
 
   # Print exit message
 	li $v0, 4
 	la $a0, end_msg
 	syscall