.data
x: .long 32
y: .long 4
f1: .space 4
f2: .space 4
p: .asciz "PASS"
f: .asciz "FAIL"
.text
.globl main
main:

mov $0,%edx
mov x,%eax
mov $16,%ebx
idiv %ebx
mov %eax,f1


mov y,%eax
mov $16,%ebx
imul %ebx
mov %eax,f2

suma:
mov f1,%eax
add %eax,f2

v2:
mov $0,%edx
mov x,%eax
mov $16,%ebx
idiv %ebx
mov %eax, x

mov y,%eax
mov $16,%ebx
imul %ebx
add x,%eax

comp:
cmp %eax, f2
je etda
mov $4,%eax
mov $1,%ebx
mov $f,%ecx
mov $4,%edx
int $0x80 
jmp exit

etda:
mov $4,%eax
mov $1,%ebx
mov $p,%ecx
mov $4,%edx
int $0x80 


exit:
mov $1,%eax
mov $0,%ebx
int $0x80
