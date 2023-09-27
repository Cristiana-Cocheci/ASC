.data
    n: .space 4
    imposibil: .asciz "imposibil\n"
    fs1: .asciz "%d\n"
    fs2: .asciz "%s\n"
    fs3: .asciz "%c\n"
    s: .space 100
.text
atoi:
    # 8(%ebp)== s
    pushl %ebp
    mov %esp,%ebp

    pushl $0 # lungimea sirului== -4(%ebp)
    pushl $0 # n== -8(%ebp)
    pushl $0 # c== -12(%ebp)

    pushl 8(%ebp)
    call strlen
    popl %edx
    movl %eax, -4(%ebp)

    lea s,%esi
    mov $0,%ecx
    for:
    cmp %ecx, -4(%ebp)
    je afara
   # mov $0,%eax
    mov (%esi,%ecx,1),%al

    cmp $48,%al
    jl impos
    cmp $57,%al
    jg impos
    mov %al,-12(%ebp)
    

    mov -12(%ebp),%ebx
    sub $48,%ebx
    mov %ebx,-12(%ebp)
    
    mov -8(%ebp),%eax
    movl $0,%edx
    mov $10,%ebx
    mull %ebx
    add -12(%ebp),%eax
    movl %eax, -8(%ebp)

    incl %ecx
    jmp for

    impos:
        mov $-1,%eax
        jmp af
        
    afara:
    mov -8(%ebp),%eax
af: 

    popl %edx
    popl %edx
    popl %edx
    popl %ebp
    ret

.globl main
main:
    pushl $s
    call gets
    popl %ebx

    pushl $s
    call atoi
    pop %ebx

    mov %eax,n
    mov $-1,%ebx
    cmp n,%ebx
    je af_imp
af_rez:
    pushl n
    pushl $fs1
    call printf
    popl %ebx
    popl %ebx
    jmp exit

af_imp:
    pushl $imposibil
    call printf
    popl %ebx
exit:
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80
