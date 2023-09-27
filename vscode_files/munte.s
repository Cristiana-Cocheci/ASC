.data
     n: .space 4
     creste: .long 1
     a: .space 4
     b: .space 4
     cit: .asciz "%d"
     af: .asciz "MUNTE\n"
     af2: .asciz "NU E MUNTE\n"
.text
.globl main
main:

citire:
    pushl $n
    pushl $cit
    call scanf
    pop %ebx
    pop %ebx

    pushl $a
    pushl $cit
    call scanf
    pop %ebx
    pop %ebx

    mov $1,%ecx

for:
    cmp %ecx,n
    je da
    inc %ecx

    pusha
    pushl $b
    pushl $cit
    call scanf
    pop %ebx
    pop %ebx
    popa

    mov $1,%eax
    cmp %eax,creste
    je urcus

scade:
    mov b,%eax
    cmp %eax,a
    jl nu
    mov %eax,a
    jmp for

urcus:
    mov b,%eax
    cmp %eax,a
    jg varf
    jmp for
cont:
    mov %eax,a
    jmp for

varf:
    mov $0,%edx
    mov %edx,creste
    jmp cont




nu:
    pushl $af2
    call printf
    pop %ebx
    jmp exit

da:
    pushl $af
    call printf
    pop %ebx

exit:
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80
