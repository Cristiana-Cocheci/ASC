.data
a: .long 5
b: .long 3
text1: .asciz "Text 1\n"
text2: .asciz "Text 2\n"

.text

.globl main

main:
mov a, %eax
mov b, %ebx
cmp %eax, %ebx
jge et2
mov $4, %eax
mov $1, %ebx
mov $text1, %ecx
mov $8, %edx
int $0x80
jmp fin

et2:
mov $4, %eax
mov $1, %ebx
mov $text2, %ecx
mov $8, %edx
int $0x80

fin:
mov $1, %eax
mov $0, %ebx
int $0x80

