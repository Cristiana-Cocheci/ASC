.data
	x: .long 18
	p: .long 1
	cnt: .long 0
.text
.globl main
main:
	mov x,%ebx
	cmp $0,%ebx
	je exit
	mov cnt,%ecx
	add $1,%ecx
	mov %ecx,cnt
	mov x,%ecx
	shr $1,%ecx
	mov %ecx,x
	mov p,%eax
	mov $2,%ebx
	mull %ebx
	mov %eax,p
	jmp main

exit:
	mov $1,%eax
	mov $0,%ebx
	int $0x80
