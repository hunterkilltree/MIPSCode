.data

	
	display1: .asciiz "\nSum of 10 interger numbers: "
	
	integerArray: .word 1, 2, 3, 4, 5, 6,7 ,8 ,9, 100

.text

.main:
	
	la $s1, integerArray
	
	and $t1, $t1, $zero
	addi $t2, $zero, 40
	and $s0, $s0, $zero

LOOP :
	add $t0, $t1, $s1
	lw  $t3, 0($t0)
	add $s0, $s0, $t3
	addi $t1, $t1, 4
	bne $t1, $t2, LOOP
	
	li $v0, 4
	la $a0, display1
	syscall

	li $v0, 1
	add $a0, $s0, $0
	syscall

# done 16/4/2019	
