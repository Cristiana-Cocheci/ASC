.data
x: .long 1,3,6,7,9
n1: .long 5
n2 : .long 10
c: .long 0x64636261
s: .space 11
.text
.globl main
main:
	mov $s,%edi
	mov $x,%esi
	movb c,%al
	mov $0,%ecx
etloop1:
	cmp n2,%ecx
	je exitl1
	mov %al, (%edi,%ecx,1)
	inc %ecx
	jmp etloop1
exitl1:
	 mov $c,%eax
	 movb 1(%eax),%al
	 mov $0,%ecx
	 
etloop2:
	 cmp n1,%ecx
	 je exit
	 mov (%esi,%ecx,4),%ebx
	 mov %al,(%edi,%ebx,1)
	 inc %ecx
	 jmp etloop2
	

exit:
	mov $10,%ecx
	movb $0, (%edi,%ecx,1)
	mov $4,%eax
	mov $1,%ebx
	mov $s,%ecx
	mov $11, %edx
	int $0x80
	mov $1,%eax
	mov $0,%ebx
	int  $0x80
