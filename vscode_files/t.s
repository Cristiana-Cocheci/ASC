.data
    var: .long 4
    fs1: .asciz "%ld "
    fs2: .asciz "\n"
.text
proc:
    pushl %ebp
    mov %esp,%ebp

    pushl 8(%ebp)
    pushl $fs1
    call printf
    add $8,%esp
    
    cmp $0,8(%ebp)
    je salt
    mov 8(%ebp),%eax
    dec %eax

    pushl %eax
    call proc
    add $4,%esp

 salt:
    popl %ebp
    ret

.globl main
main:
    pushl var
    call proc
    addl $4,%esi

    pushl $fs2
    call printf
    add $4,%esp
 
exit:
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80






















.data
    n1: .long 5
    n2: .long 6
    k: .long 3
    fs1: .asciz "%ld\n"
.text
rest:
    pushl %ebp
    mov %esp,%ebp
    push %ebx

    movl 8(%ebp), %eax
    movl 12(%ebp),%ebx
    xor %edx,%edx

    div %ebx
    # eax== cat,, edx== rest

    mov %edx,%eax

    popl %ebx
    popl %ebp
    ret

proc:
    pushl %ebp
    mov %esp,%ebp

    # 8(%ebp)==arg0, 12(%ebp)==arg1, 16(%ebp)== arg2

    sub $4,%esp

    movl 8(%ebp), %eax
    addl 12(%ebp),%eax

    mov %eax,-4(%ebp) # x=-4(%ebp)
    # pushl %eax

    pushl 16(%ebp)
    pushl -4(%ebp)
    call rest
    add $8,%esp
    # rest va returna prin registrul eax

    add $4,%esp
    popl %ebp
    ret

.globl main
main:
    pushl k
    pushl n2
    pushl n1
    call proc
    # popl %ebx
    # popl %ebx
    # popl %ebx
    add $12,%esp
    
    pushl %eax
    pushl $fs1
    call printf
    # popl %ebx
    # popl %ebx
    add $8,%esp
    
exit:
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80
