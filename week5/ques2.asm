.data

	display1: .asciiz "Input choice 0 or 1 or 2 : "
	display2: .asciiz "please input an another integer numbers\n"
	display3: .asciiz "Result: "
	
.text

main:
	addi $s1, $s1, 10 # b = 10
	addi $s2, $s2, 5 # c = 5
	
	addi $t0, $zero, 0 # choice 0
	addi $t2, $zero, 1
	addi $t3, $zero, 2
	
	li $v0, 4
	la $a0, display1
	syscall
	
	li $v0, 5 # get input
	syscall
	 
	add $t1, $t1, $v0 # add choice to $t1
	
	bne $t0, $t1, GO1
	add $s0, $s1, $s2 # a = b + c
	j EXIT1
GO1:
	bne $t2, $t1, GO2
	sub $s0, $s1, $s2 # a = b - c
	j EXIT2
GO2:
	bne $t3, $t1, Default
	sub $s0, $s2, $s1 # a = c - b
	j EXIT3
	
Default:
	li $v0, 4
	la $a0, display2
	syscall
	j EXIT4
	

EXIT1: 
EXIT2: 
EXIT3:
	
	li $v0, 4
	la $a0, display3
	syscall
	
	li $v0, 1
	add $a0, $s0, $zero
	syscall

EXIT4:
