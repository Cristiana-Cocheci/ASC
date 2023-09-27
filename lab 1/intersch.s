.data
x: .long 6
y: .long 7
.text
.globl main
main:

movl x,%eax
movl y,%ebx
movl %eax, y
movl %ebx, x

mov $1,%eax
mov $0,%ebx
int $0x80
