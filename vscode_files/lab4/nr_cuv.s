.data
    s: .space 256
    nr: .long 0
    l: .space 4
    spatiu: .asciz " "
    print: .asciz "Sirul are %d cuvinte\n"
.text
.globl main
main:
    pushl $s
    call gets
    pop %ebx
lungime:
    pushl $s
    call strlen
    pop %ebx
    mov %eax,l

    lea s,%esi
    mov $0,%ecx
    
for:
    cmp l,%ecx
    je afisare
    movb (%esi,%ecx,1),%al
    inc %ecx
    cmp spatiu,%al
    je increase
    jmp for

increase:
    incl nr
    jmp for

afisare:
    incl nr
    pushl nr
    pushl $print
    call printf
    pop %ebx
    pop %ebx

exit:
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80