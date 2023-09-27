.data
    n: .space 4
    fs1: .asciz "%d"
    fs2: .asciz "%d DA\n"

.text
.globl main
main:

citire:
    pushl $n
    pushl $fs1
    call scanf
    pop %ebx
    pop %ebx



afisare:
    pushl n
    pushl $fs2
    call printf
    pop %ebx
    pop %ebx

exit:
    mov $1,%eax
    xor %ebx,%ebx
    int $0x80
