.data 
x: .byte 1
y: .word 2
z: .long 3
w: .single 3.5
s: .space 12
.text
.globl main
main:
mov $0,%eax
mov $x,%eax
mov (%eax),%ebx
mov y,%ebx
mov z,%ebx
movl z,%ebx
mov w,%ecx

citire:
mov $3,%eax
mov $0,%ebx
mov $s,%ecx
mov $12,%edx
int $0x80

scriere:
mov $4,%eax
mov $1,%ebx
mov $s,%ecx
mov $12,%edx
int $0x80

out:
mov $1,%eax
mov $0,%ebx
int $0x80
