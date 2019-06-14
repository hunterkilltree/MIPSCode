.data
		display1: .asciiz "\nInput value is greater than or euqal 0 and less than 10 : "
		display2: .asciiz "\nThe value at this index: "
		display3: .asciiz "\nInvalid value"
		integerArray: .word 11, 0, 1, 2, 3, 4, 5, 6, 7, 8
.text

.main:

	la $s1, integerArray # load address
	and $s0, $s0, $zero # int res = 0
	
	
	li $v0, 4 
	la $a0, display1
	syscall
	
	li $v0, 5 # get input
	syscall
	
	add $s2, $v0, $zero # store input to $s2
	addi $t2, $zero, -1 # store $t2 = -1
	slti $t1, $s2, 10 # input < 10 ? 1:0
	slt $t4, $t2, $s2# -1 < input ? 1 : 0
	
	bne $t1, $t4, ELSE
	sll $t3, $s2, 2 # index * 4 to get the address
	add $t3, $t3, $s1
	lw $s0, 0($t3)
	
	
	li $v0, 4
	la $a0, display2
	syscall

	li $v0, 1
	add $a0, $s0, $0
	syscall
	
	j EXIT
	
ELSE:
	li $v0, 4
	la $a0, display3
	syscall
	
EXIT:	
