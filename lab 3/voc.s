.data
	cuv: .space 100
	fcitire: .asciz "%s\n"
	fscriere: .asciz "Numarul de vocale este %d"
	l: .space 4
	nr: .long 0
.text
.globl main
main:
	pushl $cuv
	pushl $fcitire
	call gets
	pop %ebx
	pop %ebx
	
	pushl $cuv
	call strlen
	popl %ebx
	
	mov %eax,l
	mov $0,%ecx
	lea cuv,%esi
	mov $0,%ebx
	
for:
	mov (%esi,%ecx,1),%edi
	cmp 'a',%edi
	je da
	cmp 'e',%edi
	je da
	cmp 'i',%edi
	je da
	cmp 'o',%edi
	je da
	cmp 'u',%edi
	je da
	
mai_departe:
	inc %ecx
	cmp %ecx,l
	je exit
	jmp for
	
da:
	inc %ebx
	jmp mai_departe
	
exit:
	push %ebx
	push $fscriere
	call printf
	pop %ebx
	pop %ebx
	
	mov $1,%eax
	xor %ebx,%ebx
	int $0x80
