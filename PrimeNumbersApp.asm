
##############################################################################
#																			 #
#					Gjetja e numrave prime dhe jo prime	  					 #
#																			 #
##############################################################################

.data
enterint: .asciiz "Enter positive integer to check: "	
notprime: .asciiz " is not a prime number\n"	
isprime: .asciiz " is a prime number\n "	

.text
.globl main

prime:
	addi $t2, $zero, 2				
	div $s3 $a1, 2					
	loop_:
		bgt $t2, $s3, exitloop
	
		div $a1, $t2				
		mfhi $s2					
		
		beq $s2, 0, numbereven		
		#beq $s2, 1, numberodd
		
		addi $t2, $t2, 1			
		j loop_
		
	exitloop:
	
		#numberodd:
		addi $s4, $zero, 0
		addi $v1, $s4, 0			
		jr $ra
		
		numbereven:
		addi $s2, $zero, 1
		addi $v1, $s2, 0			
		jr $ra	

main:

	li $v0, 4						
	la $a0, enterint
	syscall

	li $v0, 5						
	syscall

	move $t0, $v0					
	
	beq $t0, 1, isnotprime
	
	addi $a1, $t0, 0
	jal prime						
	
	move $t1, $v1					
	beq $t1, 1, isnotprime			

	li $v0, 1						
	move $a0, $t0
	syscall
	
	li $v0, 4						
	la $a0, isprime		
	syscall
	
	j main
	
	li $v0, 10						
	syscall
	
	isnotprime:
		
		li $v0, 1					
		move $a0, $t0
		syscall
		
		li $v0, 4					
		la $a0, notprime
		syscall
		
		j main

		li $v0, 10					
		syscall
		