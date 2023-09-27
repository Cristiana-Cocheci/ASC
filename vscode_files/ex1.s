.data
    n: .space 4
    sum: .space 4
    fs1: .asciz "%d"
    fs2: .asciz "%d\n"
.text
#   int d=1,s=0;
#   int n2=n/2;
#   while(d<=n2)
#   {
#       if(n%d==0)
#       {
#           s+=d;
#       }
#       d++;
#   }

    perfect:
        pushl %ebp
        movl %esp,%ebp

        # n == 8(%ebp)
        pushl $0 # s= -4(%ebp)
        pushl $1 # d= -8(%ebp)
        pushl $0 # n2= -12(%ebp)


        mov 8(%ebp),%eax
        mov $0,%edx
        mov $2,%ebx
        div %ebx
        mov %eax, -12(%ebp)


    while:
        
        mov -12(%ebp),%ebx
        cmp -8(%ebp),%ebx
        jl iesire_proc


        mov $0,%edx
        mov 8(%ebp),%eax
        mov -8(%ebp),%ebx
        div %ebx

        cmp $0,%edx
        jne final
        
        mov -8(%ebp),%ebx
        addl %ebx,-4(%ebp)



        final:
        mov -8(%ebp),%ebx
        incl %ebx
        mov %ebx, -8(%ebp)
        jmp while

    iesire_proc:
        movl -4(%ebp),%eax
        pop %edx
        pop %edx
        pop %edx
        pop %ebp
        ret

.globl main
main:
    pushl $n
    pushl $fs1
    call scanf
    popl %ebx
    popl %ebx

    pushl n
    call perfect
    popl %ebx

    mov %eax,sum

    pushl sum
    pushl $fs2
    call printf
    popl %ebx
    popl %ebx

exit:
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80

