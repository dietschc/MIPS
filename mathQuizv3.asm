 .data
    start_msg:.asciiz "Welcome to a Math Quiz.\n"
    whatIs_msg: .asciiz "What is "
    plusSign: .asciiz " + "
    minusSign: .asciiz " - "
    multiplySign: .asciiz " x "
    divideSign: .asciiz " / "
    equalSign: .asciiz " Answer = "
    questionMark: .asciiz "? "
    value1:.asciiz "Enter the first number: "
    value2:.asciiz "Enter the second number: "
    resultText:.asciiz "Your final result is: "
    end_msg:.asciiz "Thank you for playing MathQuiz"
    newline:.asciiz "\n"
    
.text
.globl main
main:
   # Setup temp registers with values that correspond to operations
   li $t3, 0
   li $t4, 1
   li $t5, 2
   li $t6, 3
   
   # Print welcome message
   li $v0, 4
   la $a0, start_msg
   syscall

   # Create random number for value1
   li $v0, 42
   la $a1, 20 # Set upper limit for random value range
   syscall
   move $t0, $a0
    
   # Create random number for value2
   li $v0, 42
   la $a1, 20 # Set upper limit for random value range
   syscall
   move $t1, $a0
   
   # Create random number for operator
   li $v0, 42
   la $a1, 3 # Set upper limit for random value range
   syscall
   move $t2, $a0

   # Print what is message
   li $v0, 4
   la $a0, whatIs_msg
   syscall

   # Branch here
   beq $t2, $t3, addBlock
   beq $t2, $t4, subtractBlock
   beq $t2, $t5, multiplyBlock
   beq $t2, $t6, divideBlock
    
addBlock:
   # Perform addition calculation and store value into temp register 7
   add $t7, $t0, $t1

   # Print first value
   li $v0, 1
   la $a0, ($t0)
   syscall
   
   # Print operator sign
   li $v0, 4
   la $a0, plusSign
   syscall
   
   # Print second value
   li $v0, 1
   la $a0, ($t1)
   syscall
   
   # Print question mark
   li $v0, 4
   la $a0, questionMark
   syscall
   
   # Print equals sign
   li $v0, 4
   la $a0, equalSign
   syscall
    
   # Print calculation result
   li $v0, 1
   la $a0, ($t7)
   syscall
   
   # Jump to exit function
   j exit
   
subtractBlock:
   # Perform subtraction calculation and store value into temp register 7
   sub $t7, $t0, $t1

   # Print first value
   li $v0, 1
   la $a0, ($t0)
   syscall
   
   # Print operator sign
   li $v0, 4
   la $a0, minusSign
   syscall
   
   # Print second value
   li $v0, 1
   la $a0, ($t1)
   syscall

   # Print question mark
   li $v0, 4
   la $a0, questionMark
   syscall
       
   # Print equals sign
   li $v0, 4
   la $a0, equalSign
   syscall
    
   # Print calculation result
   li $v0, 1
   la $a0, ($t7)
   syscall
    
   # Jump to exit function
   j exit
    
multiplyBlock:
   # Perform multiplication calculation and store value into temp register 7
   mul $t7, $t0, $t1

   # Print first value
   li $v0, 1
   la $a0, ($t0)
   syscall
   
   # Print operator sign
   li $v0, 4
   la $a0, multiplySign
   syscall
   
   # Print second value
   li $v0, 1
   la $a0, ($t1)
   syscall

   # Print question mark
   li $v0, 4
   la $a0, questionMark
   syscall
           
   # Print equals sign
   li $v0, 4
   la $a0, equalSign
   syscall
    
   # Print calculation result
   li $v0, 1
   la $a0, ($t7)
   syscall
   # Jump to exit function
   j exit

divideBlock:
   # Perform division calculation and store value into temp register 7
   div $t7, $t0, $t1

   # Print first value
   li $v0, 1
   la $a0, ($t0)
   syscall
   
   # Print operator sign
   li $v0, 4
   la $a0, divideSign
   syscall
   
   # Print second value
   li $v0, 1
   la $a0, ($t1)
   syscall

   # Print question mark
   li $v0, 4
   la $a0, questionMark
   syscall
           
   # Print equals sign
   li $v0, 4
   la $a0, equalSign
   syscall
    
   # Print calculation result
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