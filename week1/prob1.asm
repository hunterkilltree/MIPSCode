.data

display1: .asciiz "\nInput an interger number : "
display2: .asciiz "\nYour input after increasing 1 unit: "

.text
main:
	li $v0, 4
	la $a0, display1
	syscall
	
	li $v0, 5
	syscall
	
	addi $s0, $v0, 1
	
	li $v0, 4
	la $a0, display2
	syscall
	
	li $v0, 1
	add $a0, $s0, $0
	syscall
	