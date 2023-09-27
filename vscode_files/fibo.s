.data
    n: .space 4
    fs1: .asciz "%d"
    fs2: .asciz "%d\n"
.text
fibo:
    pushl %ebp
    movl %esp,%ebp

    # n =8(ebp)

    pushl $0 # a= -4(%esp)
    pushl $0 # b= -8(%esp)  \ \ echiv cu subl $8,%esp, dar neitializate cu 0
    
    movl 8(%ebp),%eax # eax nu trb restaurat
    cmp $2, %eax
    jl exit
    
    recfibo:
        decl %eax

        pushl %eax
        call fibo
        popl %ecx

        movl %eax, -4(%ebp) # a=fibo(4)

        movl 8(%ebp),%eax
        subl $2,%eax

        pushl %eax
        call fibo
        popl %ecx

        movl %eax, -8(%ebp) # b=fibo(3)

        add -4(%ebp),%eax

    exit:
        popl %ecx
        popl %ecx

        popl %ebp
        ret

.globl main
main:

    pushl $n
    pushl $fs1
    call scanf
    pop %ebx
    pop %ebx

    pushl n
    call fibo
    pop %ebx

    pushl %eax
    pushl $fs2
    call printf
    pop %ebx
    pop %ebx

ex:
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80
