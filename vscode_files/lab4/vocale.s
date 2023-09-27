.data
    r: .space 4
    s: .space 100
    v: .asciz "aeiou"
    l: .space 4
    c: .space 1
    citire: .asciz "%s"
    afisare: .asciz "Textul are %d vocale\n"
    nr: .long 0
.text
.globl main
main:
    pushl $s
    pushl $citire
    call scanf
    popl %ebx
    popl %ebx

    pushl $s
    call strlen
    pop %ebx

    mov %eax,l
    lea s,%esi
    mov $0,%ecx
           
for:
    cmp l,%ecx
    je gata
    movb (%esi,%ecx,1),%al
    movb %al,c
    inc %ecx

    pusha
    pushl c
    pushl $v
    call strchr
    pop %ebx
    pop %ebx
    mov %eax,r
    popa
    mov r,%eax

    cmp $0,%eax
    jne adaug
    jmp for

adaug:
    incl nr
    jmp for
    
gata:
    pushl nr
    pushl $afisare
    call printf
    pop %ebx
    pop %ebx


exit: 
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80

