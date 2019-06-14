.data
		display1: .asciiz "\nInput value is greater than or euqal 0 and less than 10 : "
		display2: .asciiz "\nThe value at this index: "
		integerArray: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
.text

.main:

	la $s1, integerArray # load address
	and $s0, $s0, $zero # int res = 0
	
	
	li $v0, 4 
	la $a0, display1
	syscall
	
	li $v0, 5 # get input
	syscall
	
	sll $t3, $v0, 2
	add $t3, $t3, $s1
	lw $s0, 0($t3)
	
	li $v0, 4
	la $a0, display2
	syscall

	li $v0, 1
	add $a0, $s0, $0
	syscall
	
