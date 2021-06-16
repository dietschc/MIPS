.data
welcome_str:.asciiz"Hello, welcome to MathQuiz, here is your first problem:\n"

.text
.globl main

main:
	li $v0, 4
	la $a0, welcome_str
	syscall

