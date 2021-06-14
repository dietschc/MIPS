.data
	start_msg:.asciiz "Welcome to a Math Quiz.\nLets get started. "
	whatIs_msg: .asciiz "What is "
	plussSign: .asciiz " + "
	minusSign: .asciiz " - "
	multiplySign: .asciiz " x "
	divideSign: .asciiz " / "
	equalSign: .asciiz " = "
	questionMark: .asciiz " ? "
	exit_msg: .asciiz "Thank You for Playing.\n"
	add_msg: .asciiz "This is an Addition problem.\n"
	subtract_msg: .asciiz "This is a Subtraction problem.\n"
	multiply_msg: .asciiz "This is a Multiplication problem.\n"
	divide_msg: .asciiz "This is a division problem.\n"
	correct_msg: .asciiz "That answer is correct.\n"
	incorrectAns_msg: .asciiz "That answer is incorrect.\n"
	attempted_msg: .asciiz "Number of attempted questions: "
	correctAns_msg: .asciiz "Number of correct answeres: "
	score_msg: .asciiz "Your score is "
	newline:.asciiz "\n"
	
.text
.globl main

main:	
	li $v0, 4 # greet the user
	la $a0, start_msg 
	syscall
	#print empty line
	li $v0, 4   #display new line
	la $a0, newline 
	syscall
	
	#**** set up constants to compare to the random number
	#**** determine what operation block the code goes to
	addi $s5, $s5, 1
	addi $s6, $s6, 2
	addi $s7, $s7, 3
		
loop:	
	#******* Generate the random number for the operation
	#******* 0 = add, 1 = subtract, 2 = multiply, 3 = divide
	li   $a1, 4        # upper bound range of returned value, 0-3
	li   $v0, 42       # system call for random int range
	syscall
	move $s0, $a0   #save random number to register	
	
	#**** compare random number to constant, determine operation block
	# if random number = 0 drop through to addBlock
	
	BEQ $s5, $s0, subractBlock  #random number = 1
	BEQ $s6, $s0, multiplyBlock  #random number = 2
	BEQ $s7, $s0, divideBlock  #random number = 3

		
	#*******************************
	#**** different operation blocks
addBlock:
	#print empty line
	li $v0, 4   #display new line
	la $a0, newline 
	syscall
	#print empty line
	li $v0, 4   #display new line
	la $a0, newline 
	syscall
	li $v0, 4   #display add message
	la $a0, add_msg
	syscall
	# implement add operation 
	
	#j loop
		
subractBlock:
	#print empty line
	li $v0, 4   #display new line
	la $a0, newline 
	syscall
	#print empty line
	li $v0, 4   #display new line
	la $a0, newline 
	syscall
	li $v0, 4   #display add message
	la $a0, subtract_msg
	syscall
	
		
	#j loop
	
multiplyBlock:
	#print empty line
	li $v0, 4   #display new line
	la $a0, newline 
	syscall
	#print empty line
	li $v0, 4   #display new line
	la $a0, newline 
	syscall
	li $v0, 4   #display add message
	la $a0, multiply_msg
	syscall
	
		
	#j loop
		
divideBlock:
	#j addBlock
	#print empty line
	li $v0, 4   #display new line
	la $a0, newline 
	syscall
	#print empty line
	li $v0, 4   #display new line
	la $a0, newline 
	syscall
	li $v0, 4   #display add message
	la $a0, divide_msg
	syscall

		
	#j loop
	







