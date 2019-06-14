.data
		display1: .asciiz "\nInput value: "
		display2: .asciiz "\nSum: "
		integerArray: .word 0:10
.text


.main:

	la $s1, integerArray # load address
	and $t1, $t1, $zero # init i = 0
	addi $t2, $zero, 40 # n = 40
	and $s0, $s0, $zero # int res = 0
	
LOOP1 :
	add $t0, $t1, $s1
	
	li $v0, 4 # get input
	la $a0, display1
	syscall
	
	li $v0, 5
	syscall
	
	sw  $v0, 0($t0) #store
	
	add $s0, $s0, $t3
	addi $t1, $t1, 4
	bne $t1, $t2, LOOP1
	
	and $t1, $t1, $zero # int i = 0
LOOP :
	add $t0, $t1, $s1
	lw  $t3, 0($t0)
	add $s0, $s0, $t3
	addi $t1, $t1, 4
	bne $t1, $t2, LOOP
	
	
	li $v0, 4
	la $a0, display2
	syscall

	li $v0, 1
	add $a0, $s0, $0
	syscall
	
#done 16/4/2019
	
	