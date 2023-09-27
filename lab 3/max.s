.data
v: .long 1, 2, 1, 2, 3, 3, 3, 4, 5
n: .long 9
max: .space 4
app: .space 4

.text
.globl main
main:
mov $0,%ecx
lea v,%edi
mov $0,%eax
mov $0,%ebx
mov n,%esi

for:
movl (%edi,%ecx,4),%edx
add $1,%ecx
cmp %eax,%edx
je egal
jg mai_mare

iesire_poate:
cmp %ecx,%esi
je repart
jmp for

mai_mare:
mov %edx,%eax
mov $1,%ebx
jmp iesire_poate

egal:
add $1,%ebx
jmp iesire_poate

repart:
mov %eax,max
mov %ebx,app

exit:
mov $1,%eax
mov $0,%ebx
int $0x80
