.data
		display1: .asciiz "\nReverse array : "
		space : .asciiz " "
		integerArray: .word 1, 3, 5, 7, 9, 11, 13, 15, 17, 19
		
.text

.main:

	la $s1, integerArray # load address
	
	addi $t0, $s1, -4 #  store the address of integerArray to $t0 
	
	addi $t1, $s1, 40 #  store the address of integerArray final pos
	
LOOP:
	addi $t0, $t0, 4
	
	beq $t1, $t0, EXIT
	
	addi $t1, $t1, -4
	
	lw $t2, 0($t0) # first pos
	lw $t3, 0($t1) # final pos
	
	sw $t2, 0($t1)
	sw $t3, 0($t0)
		
	bne $t1, $t0, LOOP
	
EXIT:
		
	and $t1, $t1, $zero # int i = 0	
	addi $t2, $0, 40
	
	li $v0, 4
	la $a0, display1
	syscall

LOOP2:
	add $t0, $t1, $s1
	lw  $t3, 0($t0)
	
	li $v0, 1
	add $a0, $t3, $0
	syscall
	
	li $v0, 4
	la $a0, space
	syscall

	addi $t1, $t1, 4
	bne $t1, $t2, LOOP2
	
