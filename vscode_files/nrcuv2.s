.data
    s: .space 256
    l: .space 4
    nr: .long 5
    afisare: .asciz "Sirul are %d cuvinte\n"
    p: .space 4
    sep: .ascii " "
.text
.globl main
main:
citire:
    pushl $s
    call gets
    popl %ebx

init:
    lea s,%esi

    pusha
    pushl $sep
    pushl $s
    call strtok
    pop %ebx
    pop %ebx
    movl %eax,p
    popa

while:
    mov $0,%eax
    cmp p,%eax
    je af

    pusha
    pushl $sep
    pushl $0
    call strtok
    pop %ebx
    pop %ebx
    mov %eax,p
    popa
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
