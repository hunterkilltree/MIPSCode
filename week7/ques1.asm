.data
	display1: .asciiz "\nResult: "
	numberOfElements: .word 10
	integerArray: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text

	main:
		la $s0, integerArray # base address of array
		la $t0, numberOfElements # load address
		lw $s1, 0($t0) # load k
		
		add $a0, $s0, $zero # parameter address of v
		add $a1, $s1, $zero # parameter k
		
		jal sum
		add $s3, $zero, $v0
		li $v0, 4 
		la $a0, display1
		syscall
		
		li $v0, 1
		add $a0, $s3, $zero #load result of $s0 to $a0  
		syscall
	
		j Exit
	
	sum:
		addi $sp, $sp, -12 # make a room for 3 register
		sw $ra, 0($sp)
		sw $a0, 4($sp)
		sw $a1, 8 ($sp)
		
		addi $t2, $zero, 1 # assign 1 to $t2
		beq $a1,  $t2, baseCase # k == 1 return v[0]
		
		addi $a1, $a1, -1 # reduce k - 1
		addi $a0, $a0, 4

		jal sum
		lw $ra, 0($sp)
		lw $a0, 4($sp)
		lw $a1, 8 ($sp)
		addi $sp, $sp, 12
		
		lw $t4,0($a0)
		add $v0,$v0,$t4
		jr $ra
		
	baseCase:
		lw $ra, 0($sp)
		lw $a0, 4($sp)
		lw $a1, 8 ($sp)
		addi $sp, $sp, 12
		
		lw $v0,0($a0)
		jr $ra # return
	Exit:
