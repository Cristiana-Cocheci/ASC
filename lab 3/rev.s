.data
s: .asciz "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAuziti?"
r: .asciz "mmmmmmm"
t: .space 1
n: .long 40
.text
.globl main
main:
mov n,%ecx
mov $0,%eax
lea s,%edi
lea t,%esi

etloop:
mov %ecx,%ebx
sub $1,%ebx
mov (%edi,%ebx,1),%edx
mov %edx,(%esi,%eax,1)
add $1,%eax
loop etloop

afis:
mov $4, %eax
mov $1, %ebx
mov $t, %ecx
mov $40, %edx
int $0x80


exit:
mov $1,%eax
mov $0,%ebx
int $0x80
