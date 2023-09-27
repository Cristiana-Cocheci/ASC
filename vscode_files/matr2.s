.data
    n: .space 4
    m: .space 4
    v: .space 1000
    x: .long 0
    fs1: .asciz "%d%d"
    fs2: .asciz "%d"
    fs3: .asciz "%d\n"
    
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
    lea v,%esi
    mov $0,%ecx

for1:
    cmp %ecx,n
    je afisare
    mov $0,%ebx
    for2:
        cmp %ebx,m
        je increase

        pusha
        pushl $x
        pushl $fs2
        call scanf
        pop %ebx
        pop %ebx
        popa

        mov x,%edi
        mov %ecx,%eax
        mov $0,%edx
        mull m
        add %ebx,%eax
        mov %edi,(%esi,%eax,4)
        
        incl %ebx
        jmp for2


increase:
    incl %ecx
    jmp for1
    

afisare:
    mov $0,%ecx
    for11:
    cmp %ecx,n
    je exit
    mov $0,%ebx
    for22:
        cmp %ebx,m
        je increase2

        mov %ecx,%eax
        mov $0,%edx
        mull m
        add %ebx,%eax
        mov (%esi,%eax,4),%eax
        mov %eax,x

        pusha
        pushl x
        pushl $fs3
        call printf
        pop %ebx
        pop %ebx
        popa

        incl %ebx
        jmp for22

increase2:
    incl %ecx
    jmp for11

exit:
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80