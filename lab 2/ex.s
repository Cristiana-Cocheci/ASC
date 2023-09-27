.data
x: .long 10
y: .long 128
z: .long -12
.text
.globl main
main:
jmp d
mov x,%eax
and $1,%eax

mov y,%eax
xor $1,%eax

mov x,%eax
xor %eax,%eax

mov $10,%ebx
mov $6,%eax
xor %ebx,%eax
xor %ebx,%eax

d:
jmp doi
mov x,%eax
mov %eax,%ebx
sub $1,%ebx
and %ebx,%eax

mov y,%eax
mov %eax,%ebx
sub $1,%ebx
and %ebx,%eax

mov z,%eax
mov %eax,%ebx
sub $1,%ebx
and %ebx,%eax

doi:
mov z,%eax
cmp $0,%eax
je egal
jg mare
jl mic
egal:
mov $0,%ecx
jmp exit
mare:
mov $1,%ecx
jmp exit
mic:
mov $-1,%ecx
jmp exit
exit:
mov $1,%eax
mov $0,%ebx
int $0x80
