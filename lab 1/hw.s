.data 
str: .asciz "Buna dimineata,soare!\n"
.text
.globl main
main:
mov $4, %eax
mov $1, %ebx
mov $str, %ecx
mov $23, %edx
int $0x80

mov $1, %eax
mov $0, %ebx
int $0x80

