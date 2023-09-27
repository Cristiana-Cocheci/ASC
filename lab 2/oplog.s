.data
	x: .long 15
	y: .long 64
	z: .long 0
.text
.globl main
main:
	mov z,%edx
	not %edx
	mov x,%edx
	not %edx
	mov x,%eax
	and z,%eax
	mov x,%eax
	or z,%eax
	xor x,%eax
	mov y,%edx

	movl $16,x
	shrl $1,x
	
	mov $1,%eax
	mov $0,%ebx
	int $0x80
