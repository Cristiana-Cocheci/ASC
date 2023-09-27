.data
    n: .space 4
    m: .space 4
    v: .space 1000
    x: .space 4
    fs1: .asciz "%d%d"
    fs2: .asciz "%d"
    fs3: .asciz "Maximul este %d si apare de %d ori\n"
    max: .long -1
    ap: .long 0
.text
.globl main
main:
citire:
    pushl $m
    pushl $n
    pushl $fs1
    call scanf
    pop %ebx
    pop %ebx
    pop %ebx

init:
    mov $0,%ecx

for1:
    cmp %ecx,n
    je afisare
    mov $0,%edx
    for2:
        cmp %edx,m
        je increase

        pusha
        pushl $x
        pushl $fs2
        call scanf
        pop %ebx
        pop %ebx
        popa

        mov x,%eax
        cmp %eax,max
        je aparitii
    cont:
        cmp %eax,max
        jl mai_mare    
    cont2:
        incl %edx
        jmp for2

aparitii:
    incl ap
    jmp cont

mai_mare:
    mov x,%eax
    mov %eax,max
    mov $1,%eax
    mov %eax,ap
    jmp cont2

increase:
    incl %ecx
    jmp for1
    
afisare:
    pushl ap
    pushl max
    pushl $fs3
    call printf
    pop %ebx
    pop %ebx
    pop %ebx

exit:
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80