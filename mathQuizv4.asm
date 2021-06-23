 .data
    start_msg:.asciiz "Welcome to a Math Quiz.\n"
    whatIs_msg: .asciiz "What is "
    plusSign: .asciiz " + "
    minusSign: .asciiz " - "
    multiplySign: .asciiz " x "
    divideSign: .asciiz " / "
    equalSign: .asciiz " Answer = "
    questionMark: .asciiz "? "
    correct_msg: .asciiz "That answer is correct.\n"
    incorrect_msg: .asciiz "That answer is incorrect.\n"
    resultText1: .asciiz "You solved "
    resultText2:.asciiz " math problems and got "
    resultText3: .asciiz " correct and " 
    resultText4: .asciiz " incorrect, for a score of "
    resultText5: .asciiz "%."
    end_msg:.asciiz "Thanks for playing!"
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

loop:
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
   
   # Collect user input and compare to answer
   li $v0, 5
   syscall
   
   # Branch depending on user input result
   beq $v0, -1, exit
   beq $t7, $v0, correctAnswer
   bne $t7, $v0, incorrectAnswer
   
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
    
   # Collect user input and compare to answer
   li $v0, 5
   syscall
   
   # Branch depending on user input result
   beq $v0, -1, exit
   beq $t7, $v0, correctAnswer
   bne $t7, $v0, incorrectAnswer
   
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
   
   # Collect user input and compare to answer
   li $v0, 5
   syscall
   
   # Branch depending on user input result
   beq $v0, -1, exit
   beq $t7, $v0, correctAnswer
   bne $t7, $v0, incorrectAnswer
   
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

   # Collect user input and compare to answer
   li $v0, 5
   syscall
   
   # Branch depending on user input result
   beq $v0, -1, exit
   beq $t7, $v0, correctAnswer
   bne $t7, $v0, incorrectAnswer
   
   # Jump to exit function
   j exit

correctAnswer:
   # Print correct message
   li $v0, 4
   la $a0, correct_msg
   syscall
   
   # Increment correct score count
   add $t8, $t8, 1
   
   # Jump back to beginning of loop
   j loop

incorrectAnswer:   
   # Print incorrect message
   li $v0, 4
   la $a0, incorrect_msg
   syscall

   # Increment incorrect score count
   add $t9, $t9, 1
   
   # Jump back to beginning of loop
   j loop
          
exit:
   # Print newline
   li $v0, 4
   la $a0, newline
   syscall

   # Print correct message
   li $v0, 4
   la $a0, resultText1
   syscall
   
   # Calculate total
   add $s0, $t8, $t9

   # Print total score
   li $v0, 1
   la $a0, ($s0)
   syscall

   # Print correct message
   li $v0, 4
   la $a0, resultText2
   syscall
    
   # Print correct value
   li $v0, 1
   la $a0, ($t8)
   syscall

   # Print incorrect message
   li $v0, 4
   la $a0, resultText3
   syscall
    
   # Print incorrect value
   li $v0, 1
   la $a0, ($t9)
   syscall
 
   # Print incorrect message
   li $v0, 4
   la $a0, resultText4
   syscall
   
   # Print percent sign
   li $v0, 4
   la $a0, resultText5
   syscall
 
   # Print newline
   li $v0, 4
   la $a0, newline
   syscall
 
   # Print exit message
   li $v0, 4
   la $a0, end_msg
   syscall