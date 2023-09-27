.data
n: .long 3
s: .asciz "abc"
.text
.globl main
main:
mov $s, %edi
mov $0, %ecx


loop:
cmp n,%ecx
je etexit
mov (%edi,%ecx,1),%al
sub $'a',%al
add $'A',%al
mov %al,(%edi,%ecx,1)
inc %ecx
jmp loop



etexit:
movb $0, u
	mov $4,%eax
	mov $1,%ebx
	mov $s,%ecx
	mov $4, %edx
	int $0x80

	mov $1, %eax
	mov $0, %ebx
	int $0x80
