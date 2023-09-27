.data
n: .long 7
v: .long 1245, 342, 543523, 342, 4234, 1245, 543523

.text
.globl main
main:
	lea v,%edi
	mov $0,%ecx
	mov $0,%eax
	
etloop:
	movl (%edi,%ecx,4), %edx
	xor %edx,%eax
	add $1,%ecx
	cmp %ecx,n
	jne etloop

exit:
	mov $1,%eax
	mov $0,%ebx
	int $0x80
