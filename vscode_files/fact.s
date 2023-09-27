# int fact(n){
# if(n==2) return n
# return n*fact(n-1)
# }

.data
    n: .space 4
    fs1: .asciz "%ld\n"
    fs2: .asciz "%ld"

.text
fact:
    pushl %ebp
    mov %esp,%ebp

    pushl %ebx

    movl $1,%ebx
    # 8(%ebp)==n
    cmp 8(%ebp),%ebx
    je salt
    mov 8(%ebp),%ebx
    decl %ebx
    pushl %ebx
    call fact
    addl $4,%esp
    # in eax e fact de n-1

    xor %edx, %edx
    # mov 8(%ebp),%ebx
    mull 8(%ebp)
    jmp s2

 salt:
    mov $1,%eax
 s2:
    popl %ebx
    popl %ebp
    ret

.globl main
main:
    pushl $n
    pushl $fs2
    call scanf
    addl $8,%esp

    pushl n
    call fact
    addl $4,%esp

    pushl %eax
    pushl $fs1
    call printf
    add $8,%esp
 
exit:
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80
