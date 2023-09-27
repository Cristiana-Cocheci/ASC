.data
x: .long 0
.text
.globl main
main:
jmp jumpuri
 r:
	mov $13,%eax
	mov $6,%ebx
	add %ebx,%eax
	mov $0,%edx
	mov $-4,%ecx
	idiv %ecx
	add $1,%eax
	imul %eax
swap:
	mov $12, %eax
	mov $-9, %ebx
	xor %ebx,%eax
	xor %eax,%ebx
	xor %ebx, %eax
shift:
	mov $-51,%eax
	mov $51,%ebx
	shl $4,%ebx
	sar $1,%eax
	shr $1,%ebx
jumpuri:
	mov $4,%eax
	mov $-7,%ebx
	cmp %ebx,%eax
	ja exit
	mov $33,x
exit:
	mov $1,%eax
	mov $0,%ebx
 	int $0x80
