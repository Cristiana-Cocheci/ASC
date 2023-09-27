.data
v: .long 1, 2, 3, 4, 5, 6 
l: .long 6
n: .long 7
rasp : .long -1
.text
.globl main
main:
	lea v,%esi
	mov $0,%ecx
	mov l,%ebx
	sub $1,%ebx
	mov $2,%esp

etloop:
	cmp %ecx,%ebx
	jl exit
	mov %ecx,%eax
	add %ebx,%eax
	mov $0,%edx
	div %esp
	movl (%esi,%eax,4),%edi
	cmp n,%edi
	jg mare
	jl mic
	je final
	jmp etloop
mare:
	mov %eax,%ebx
	sub $1,%ebx
	jmp etloop
mic:
	mov %eax,%ecx
	add $1,%ecx
	jmp etloop
final:
	mov %eax,rasp
	jmp exit


exit:
	mov $1,%eax
	mov $0,%ebx
	int $0x80
