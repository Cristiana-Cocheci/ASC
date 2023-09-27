.data
	x: .long 32
	y: .long 3
	sum: .space 4
.text
.globl main

main:
	mov $16,%eax
	mull x
	mov %eax,%ecx
	
	mov y,%eax
	mov $16, %ebx
	div %ebx
	
	
exit:
	mov $1,%eax
	mov $0,%ebx
	int $0x80

