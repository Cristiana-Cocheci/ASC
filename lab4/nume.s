.data
	grupa: .space 4
	nota: .space 4
	nume: .space 100
	fs1: .asciz "%ld%d\n"
	fs2: .asciz "Studentul %s din grupa %ld are nota %d.\n"
.text
.globl main
main:
	pushl $nota
	pushl $grupa
	pushl $fs1
	call scanf
	pop %ebx
	pop %ebx
	pop %ebx
	
	pushl $nume
	call gets
	popl %ebx
	
	pushl nota
	pushl grupa
	pushl $nume
	pushl $fs2
	call printf
	pop %ebx
	pop %ebx
	pop %ebx
	pop %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
exit:
	mov $1,%eax
	xor %ebx,%ebx
	int $0x80
