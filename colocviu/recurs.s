.data
x: .space 4
fs1: .asciz "%d"
fs2: .asciz "%d\n"
.text
f:
    pushl %ebp
    movl %esp, %ebp

    # 8(%ebp)==x
    base_case:
    movl $1,%ecx
    movl $0,%eax
    cmp %ecx, 8(%ebp)
    je outt

    xorl %edx,%edx
    movl 8(%ebp),%eax

    movl $2,%ecx
    divl %ecx

    cmp $1,%edx
    je impar

    par:
        pushl %eax
        call f
        popl %ecx
        incl %eax
        jmp outt

    impar:
        movl 8(%ebp),%eax
        movl $3,%ecx
        xorl %edx,%edx
        mull %ecx
        incl %eax
        pushl %eax
        call f
        popl %ecx
        incl %eax

    outt:
    popl %ebp
    ret

.globl main
main:
    pushl $x 
    pushl $fs1
    call scanf
    popl %ebx
    popl %ebx

    pushl x
    call f
    popl %ebx

    pushl %eax
    pushl $fs2
    call printf
    popl %ebx
    popl %ebx

iesire:
    movl $1,%eax
    movl $0,%ebx
    int $0x80