.data
	n: .space 4
	v: .space 4
	v2: .space 4
	fs1: .asciz "%d\n"
	s: .asciz "Sirul este crescator\n"
	s2: .asciz "Sirul nu e crescator\n"
	fs2: .asciz "%s"
	
.text
.globl main

main:
	pushl $n
	pushl $fs1
	call scanf
	pop %ebx
	pop %ebx
	
	pushl $v
	pushl $fs1
	call scanf
	pop %ebx
	pop %ebx
	
	mov v,%edx
	mov $1,%ecx
	
for:
	cmp %ecx,n
	je crescator
	
	
	pushl $v2
	pushl $fs1
	call scanf
	pop %ebx
	pop %ebx
	
	cmp %edx,v2
	jl nu_cresc
	mov v2,%edx
	
	
	add $1,%ecx
	jmp for
	

nu_cresc:
	pushl $s2
	pushl $fs2
	call printf
	pop %ebx
	pop %ebx
	
	pushl $0
	call fflush
	popl %ebx
	jmp exit
	
crescator:
	pushl $s
	pushl $fs2
	call printf
	pop %ebx
	pop %ebx
	
	pushl $0
	call fflush
	popl %ebx
	jmp exit

	
exit:
	mov $1,%eax
	xor %ebx,%ebx
	int $0x80
