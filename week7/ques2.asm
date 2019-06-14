.data
	display1: .asciiz "\nMax num: "
	numberOfElements: .word 10
	integerArray: .word 900, 1000, 8, 700, 6, 5, 4, 3, 2, 100
.text

	main:
		la $s0, integerArray # base address of array
		la $t0, numberOfElements # load address
		lw $s1, 0($t0) # load k
		
		add $a0, $s0, $zero # parameter address of v
		add $a1, $s1, $zero # parameter k
		
		jal max
		
		add $s3, $zero, $v0
		
		li $v0, 4 
		la $a0, display1
		syscall

		li $v0, 1
		add $a0, $s3, $zero #load result of $s0 to $a0  
		syscall
	
		j Exit
		
	max:
		addi $sp, $sp, -12 # make a room for 3 register
		sw $ra, 0($sp) # save return address
		sw $a0, 4($sp) 
		sw $a1, 8 ($sp) # save the number of  element
		
		addi $t2, $zero, 1 # assign 1 to $t2
		beq $a1,  $t2, baseCase # k == 1 return v[0]
		
		addi $a1, $a1, -1 # reduce k - 1
		addi $a0, $a0, 4
		
		jal max
	
		lw $ra, 0($sp)
		lw $a0, 4($sp)
		lw $a1, 8 ($sp)
		addi $sp, $sp, 12
		
		lw $t2, 0($a0)
		add $t0, $v0, $zero
		
		slt $t1, $t0, $t2 # $t0 : temp  < v[0]
		beq $t1,  $zero, L1
	
		add $v0, $t2, $zero 
		jr $ra

	baseCase:
		lw $ra, 0($sp)
		lw $a0, 4($sp)
		lw $a1, 8 ($sp)
		addi $sp, $sp, 12
		
		lw $v0, 0($a0)
		jr $ra # return
		
	L1:
		jr $ra # return
	
	Exit:
