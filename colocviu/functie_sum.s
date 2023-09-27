.data
n: .space 4
i: .space 4
v: .space 400
s: .long 0
x: .space 4
fs1: .asciz "%d"
fs2: .asciz "%d\n"
.text
suma:
    pushl %ebp
    movl %esp,%ebp
    pushl %esi
    # 8(%ebp)== n, 12(%ebp)==adresa lui v
       
     mov 12(%ebp),%esi
    xorl %edx,%edx # i=0
    xorl %eax,%eax # s=0

    for:
        cmp %edx,8(%ebp)
        jle afara
        mov (%esi,%edx,4),%ebx
        addl %ebx,%eax # s+= v[i]

        incl %edx # i++
        jmp for
   

    afara:
    popl %esi
    popl %ebp
    ret

.globl main
main:
citire:
    pushl $n
    pushl $fs1
    call scanf
    popl %ebx
    popl %ebx

    lea v, %edi
    xorl %edx,%edx
for_cit:
    cmp %edx,n
    jle apel

    pusha
    pushl $x
    pushl $fs1
    call scanf
    popl %ebx
    popl %ebx
    popa

    movl x,%eax
    movl %eax,(%edi,%edx,4)

    incl %edx
    jmp for_cit
apel:
    pushl $v
    pushl n
    call suma
    popl %ebx
    popl %ebx

    movl %eax,s
afisare:
    pushl s
    pushl $fs2
    call printf
    popl %ebx
    popl %ebx

exit:
    xor %ebx,%ebx
    movl $1,%eax
    int $0x80
