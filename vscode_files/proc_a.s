.data
    n: .space 4
    fs1: .asciz "%d"
    fs2: .asciz "Numarul citit este %d\n"
.text

afisare:
    pushl %ebp
    movl %esp,%ebp
    # n== 12(%ebp)
    # fs2 == 8(%ebp)
    pushl 12(%ebp)
    pushl 8(%ebp)
    call printf
    popl %eax
    popl %eax

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
    pushl $fs2
    call afisare
    popl %ebx
    popl %ebx

exit:
    movl $1,%eax
    xor %ebx,%ebx
    int $0x80
