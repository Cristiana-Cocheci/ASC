.data   
    s: .space 256
    r: .space 256
    l: .space 4
    c: .space 1
    fs1: .asciz "%s\n"
    fs2: .asciz "%c\n"
.text
.globl main
main:
    pushl $s
    call gets
    pop %ebx

    pushl $s
    call strlen
    pop %ebx
    mov %eax,l

    lea s,%esi
    lea r,%edi
    mov $0,%ecx


for:
    cmp %ecx,l
    je afisare

    mov (%esi,%ecx,1),%al
    mov %al,c

    pusha
    pushl c
    call toupper
    pop %ebx
    
    push %eax
    pushl $fs2
    call printf
    popl %ebx
    popl %ebx
    popa

    

    mov c,%al
    mov %al,(%edi,%ecx,1)

    inc %ecx
    jmp for

afisare:
    pushl $r
    pushl $fs1
    call printf
    popl %ebx
    popl %ebx

exit:
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80
