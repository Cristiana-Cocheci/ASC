.data
n: .space 4
fs1: .asciz "%d"
fs2: .asciz "%d\n"
.text
div:
    pushl %ebp
    movl %esp,%ebp

    # n== 8(%ebp)
    pushl $1 # -4(%ebp) == d
    pushl $0 # -8(%ebp)== contor

    pushl %ebx
    movl 8(%ebp),%ebx

    while:
        cmp %ebx,-4(%ebp)
        jg outt

        xorl %edx,%edx
        movl 8(%ebp),%eax
        movl -4(%ebp),%ecx
        idivl %ecx

        cmp $0,%edx
        jne nu
        divizibil:
        pusha
        pushl -4(%ebp)
        pushl $fs2
        call printf
        popl %ebx
        popl %ebx
        popa

        incl -8(%ebp)

        nu:
        incl -4(%ebp)
        jmp while   

    outt:
    movl -8(%ebp),%eax
    addl $8,%esp
    popl %ebx
    popl %ebp
    ret


.globl main
main:
    pushl $n
    pushl $fs1
    call scanf
    popl %ebx
    popl %ebx

    pushl n
    call div
    popl %ebx

    pushl %eax
    pushl $fs2
    call printf
    popl %ebx
    popl %ebx

exit:
    movl $1,%eax
    movl $0,%ebx
    int $0x80
