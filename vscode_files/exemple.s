.data
x: .long 2
v: .space 100
fs1: .asciz "%s"
fs2: .asciz "%c\n"
fs3: .asciz "%d/n"
.text
functie:
    pushl %ebp
    movl %esp,%ebp
    # 8(epb)== *v, 12(ebp)== x
    pushl %esi
    mov 8(%ebp),%esi
    xor %edx,%edx
    xor %eax,%eax
    while:
    cmp %edx, 12(%ebp)
    jle outt

    mov (%esi,%edx,1),%eax
    incl %edx
    jmp while

    outt:
    
    popl %esi
    popl %ebp
    ret

.globl main
main:
    pushl $v
    call gets
    popl %ebx

    pushl x 
    pushl $v
    call functie
    popl %ebx
    popl %ebx

    pushl %eax
    pushl $fs2
    call printf
    popl %ebx
    popl %ebx

exit:
    xor %ebx,%ebx
    mov $1,%eax
    int $0x80
