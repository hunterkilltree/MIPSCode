.data

display1: .asciiz "\nInput number 1: "
display2: .asciiz "\nInput number 2: "
display3: .asciiz "\nOutput: "

.text
main:
	li $v0, 4
	la $a0, display1
	syscall
	
	li $v0, 5
	syscall
	add $s0, $v0, $0
	
	
	li $v0, 4
	la $a0, display2
	syscall
	
	
	li $v0, 5
	syscall
	
	add $s1, $v0, $0
	
	li $v0, 4
	la $a0, display3
	syscall
	
	add $s2, $s1, $s0
	
	li $v0, 1
	add $a0, $s2, $0
	syscall
	
	