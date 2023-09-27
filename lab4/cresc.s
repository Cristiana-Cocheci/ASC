.data
	v: .long 1,2,3,4,5
	n: .long 5
	s1: .asciz "crescator"
	s2: .asciz "descrescator"
	r: .space 100
	fs: .asciz "%s\n"
.text
.globl main
main:
	lea v,%edi
	mov $0,%ecx
	mov (%edi,%ecx,4),%eax
	mov $1,%ecx
	
for:
	cmp n,%ecx
	je da
	mov (%edi,%ecx,4),%ebx
	cmp %eax,%ebx
	jl nu
	mov %ebx,%eax
	add $1,%ecx
	jmp for
	
da:
	push $s1
	push $fs
	call printf
	pop %ebx
	pop %ebx
	jmp afisare
	
nu:
	push $s2
	push $fs
	call printf
	pop %ebx
	pop %ebx
	
afisare:		
	pushl $0
	call fflush
	popl %ebx
	
exit:
	mov $1,%eax
	xor %ebx,%ebx
	int $0x80
	
