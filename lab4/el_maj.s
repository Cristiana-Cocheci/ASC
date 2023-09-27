.data
	e: .space 4
	nr: .long 0
	v: .space 1000
	n: .space 4
	maj: .space 4
	avantaj: .long 1
	scan_nr: .asciz "%d"
	print1: .asciz "DA! %d\n"
	print2: .asciz "NU:(\n"
.text
.globl main
main:	
	pushl $n
	pushl $scan_nr
	call scanf
	popl %ebx
	popl %ebx
	
	mov $0,%ecx
	lea v,%esi
	
for_citire:
	cmp %ecx,n
	je gata
	
	pusha
	pushl $e
	pushl $scan_nr
	call scanf
	popl %ebx
	popl %ebx
	popa
	
	mov e,%eax
	mov %eax,(%esi,%ecx,4)
	
	inc %ecx
	jmp for_citire
	
gata:
	mov $0,%ecx
	mov (%esi,%ecx,4),%eax
	mov %eax,maj
	mov $1,%ecx
	
parcurgere:
	cmp %ecx,n
	je afara
	
	mov (%esi,%ecx,4),%eax
	inc %ecx
	cmp maj,%eax
	je cresc
	
scade:
	decl avantaj
	mov $0,%ebx
	cmp avantaj,%ebx
	je maj_nou
	jmp parcurgere
	
cresc:
	incl avantaj
	jmp parcurgere
	
	
maj_nou:
	incl avantaj
	mov %eax,maj
	jmp parcurgere
	
afara:
	mov $0,%ecx
	
count:
	cmp %ecx,n
	je ies
	
	mov (%esi,%ecx,4),%eax
	inc %ecx
	cmp %eax,maj
	je plus
	jmp count
	
plus:
	incl nr
	jmp count

ies:
	mov $0,%edx
	mov n,%eax
	mov $2,%edi
	divl %edi
	cmp nr,%eax
	jl da
	
	pushl $print2
	call printf
	pop %ebx
	jmp exit
	
da:
	pushl maj
	pushl $print1
	call printf
	pop %ebx
	pop %ebx
	
	
exit:
	mov $1,%eax
	xor %ebx,%ebx
	int $0x80
	
	
