.data 

display1: .asciiz "\nInput a: "
display2: .asciiz "\nInput b: "
display3: .asciiz "\nInput c: "
display4: .asciiz "\nInput d: "
display5: .asciiz "\nOutput f = (a + b) - (c - d - 2): "
display6: .asciiz "\nOutput g = (a + b) * 3 - (c + d) * 2: "

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
	
	li $v0, 5
	syscall
	add $s2, $v0, $0
	
	li $v0, 4
	la $a0, display4
	syscall
	
	li $v0, 5
	syscall
	add $s3, $v0, $0
	
	li $v0, 4
	la $a0, display5
	syscall
	
	add $t1, $s0, $s1
	sub $t2, $s3,  $s2
	addi $t2, $t2, 2
	add $t1, $t1, $t2
	
	
	li $v0, 1
	add $a0, $t1, $0
	syscall
	
	
	
	
	#li $v0, 4
	#la $a0, display6
	#syscall
	
	