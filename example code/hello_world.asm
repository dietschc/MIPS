.data
# this is where your data will be defined.
#.word – 32-bit integer
#.half – 16-bit integer
#.byte – 8-bit integer
#.float – 32-bit floating point
#.double – 64-bit floating point
#.space – An uninitialized chunk of memory
#.ascii – An ASCII string without a null terminator
#.asciiz – An ASCII string with a null terminator
welcome_str:.asciiz"Hello world!\n"



.text
# all code for this particular program

.globl main
# this line tells MIPS that the ‘.main’ 
# label can be referenced and executed
# by other files
main:
	li $v0, 4
	la $a0, welcome_str
	syscall
# this is where your code would start
# from here MIPS will compile and run
# your instructions from top to bottom
func:
# this is a label that can be jumped
# or branched to
