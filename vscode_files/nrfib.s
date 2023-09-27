.data
    a: .space 4
    b: .space 4
    nr: .long 0
    t1: .long 1
    t2: .long 2
    c: .space 4
    cit: .asciz "%d%d"
    scr: .asciz "Intre cele doua numere date sunt %d termeni Fibonacci\n"
.text
.globl main
main:
citire:
    pushl $b
    pushl $a
    pushl $cit
    call scanf
    pop %ebx
    pop %ebx
    pop %ebx

    mov $1,%eax
    cmp a,%eax
    jne while_c1
    incl nr
    incl nr

while_c1:
    mov t2,%eax
    cmp a,%eax
    jge while_c2

    mov t1,%eax
    add t2,%eax
    mov t2,%ebx
    mov %ebx,t1
    mov %eax,t2
    jmp while_c1


while_c2:
    mov t2,%eax
    cmp b,%eax
    jg afisare

    incl nr
    mov t1,%eax
    add t2,%eax
    mov t2,%ebx
    mov %ebx,t1
    mov %eax,t2
    jmp while_c2


afisare:
    pushl nr
    pushl $scr
    call printf
    pop %ebx
    pop %ebx

exit:
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80

    // 1 1 2 3 5 8 13 21 34 55 89