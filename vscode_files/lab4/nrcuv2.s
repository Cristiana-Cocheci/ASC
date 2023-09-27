.data
    s: .space 256
    l: .space 4
    nr: .long 0
    afisare: .asciz "Sirul are %d cuvinte\n"
    p: .space 4
    sep: .asciz " "
.text
.globl main
main:
citire:
    pushl $s
    call gets
    pop %ebx

init:
    lea s,%esi

    pusha
    pushl $sep
    pushl $s
    call strtok
    pop %ebx
    pop %ebx
    popa
    mov %eax,p
    incl nr
while:
    mov $0,%eax
    cmp p,%eax
    je af

    pusha
    pushl $sep
    pushl $s
    call strtok
    pop %ebx
    pop %ebx
    popa
    mov %eax,p
    incl nr
    jmp while


af:
    pushl nr
    pushl $afisare
    call printf
    pop %ebx
    pop %ebx

exit:
     mov $1,%eax
     xor %ebx,%ebx
     int $0x80
