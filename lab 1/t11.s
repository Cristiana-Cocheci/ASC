.data 
x: .single 1.33
.text
.globl main
main:
mov $x,%eax
mov (%eax),%ebx

mov $1,%eax
mov $0,%ebx
int $0x80
