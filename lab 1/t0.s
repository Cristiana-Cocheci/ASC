.data 
x: .long 25
y: .long 65
y2: .space 1 
z: .single -12.33
.text
.globl main
main:
mov $16,%al
mov $17,%ah
mov $18, %eax
movl x,%ebx
movl $x,%ecx
mov (%ecx), %edx


mov $1, %eax
mov $0, %ebx
int $0x80
