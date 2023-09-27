.data
    cerinta: .space 4
    n: .space 4
    nrleg: .space 400
    x: .space 4
    a: .space 4
    k: .space 4
    nod_sursa: .space 4
    nod_dest: .space 4
    dimensiune: .space 4
    mres: .space 4
    m: .space 40000
    aux: .space 40000
    fs1: .asciz "%d"
    fs2: .asciz "%d "
    fs3: .asciz "%d%d%d"
    fs4: .asciz "%d\n"
    newline: .asciz "\n"
    
.text
matrix_mult:
    pushl %ebp
    movl %esp,%ebp
    # m1=8(%ebp) , m2=12(%ebp) , mres=16(%ebp) , n=20(%ebp)

    pushl $0 # -4(%ebp)==i
    pushl $0 # -8(%ebp)==j
    pushl $0 # -12(%ebp)==k
    pushl $0 # -16(%ebp)==s
    pushl $0 # -20(%ebp)==aux


    pushl %edi
    pushl %esi
    pushl %ebx
    movl 8(%ebp), %edi
    movl 12(%ebp), %esi
    movl 16(%ebp), %ebx


    for_i:
        movl 20(%ebp),%eax
        cmp -4(%ebp),%eax
        je afara_for_i

        movl $0,-8(%ebp) # j=0
        
        for_j:
            movl 20(%ebp),%eax
            cmp -8(%ebp),%eax
            je afara_for_j


            movl $0,-12(%ebp) # k=0
            movl $0,-16(%ebp) # s=0

            for_k:
                movl 20(%ebp),%eax
                cmp -12(%ebp),%eax
                je afara_for_k


                # s += m1[i][k]* m2[k][j];
                mov -4(%ebp),%eax
                mov $0,%edx
                mull 20(%ebp)
                add -12(%ebp),%eax
                
                movl (%edi,%eax,4),%ecx # ecx==m1[i][k]

                mov -12(%ebp),%eax
                mov $0,%edx
                mull 20(%ebp)
                add -8(%ebp),%eax # (%esi,%eax,4)==m2[k][j]

                movl (%esi,%eax,4), %edx
                movl %edx, -20(%ebp) # -20(%ebp)==m2[k][j]

                mov -20(%ebp),%eax
                xor %edx,%edx
                mull %ecx
                add %eax,-16(%ebp) # s += ecx*40(%ebp)

                incl -12(%ebp) # k++                
                jmp for_k
            
            afara_for_k:
                # mres[i][j]=s;
                # m[i][j] == m+ i*n +j
                mov -4(%ebp),%eax
                mov $0,%edx
                mull 20(%ebp)
                add -8(%ebp),%eax

                movl -16(%ebp), %edx
                movl %edx,(%ebx,%eax,4)

                incl -8(%ebp) # j++
                jmp for_j

        afara_for_j:
            incl -4(%ebp) # i++
            jmp for_i

    afara_for_i:
    popl %ebx
    popl %esi
    popl %edi
    addl $20, %esp # dezalocam spatiu pt variabilele locale
    popl %ebp
    ret


.globl main
main:
    pushl $cerinta
    pushl $fs1
    call scanf
    pop %ebx
    pop %ebx


CITIRE_N:
    pushl $n
    pushl $fs1
    call scanf
    pop %ebx
    pop %ebx

Dimensine_matr:
    xor %edx,%edx
    movl n,%eax
    movl n,%ebx
    mull %ebx 
    xor %edx,%edx
    movl $4,%ebx
    mull %ebx
    movl %eax,dimensiune


ALOCARE_DINAMICA:
    movl $192,%eax # syscall number
    movl $0,%ebx
    movl dimensiune,%ecx # dimensiune de alocat
    movl $3,%edx # prot: 1==prot_read, 2==prot_write; 1 SAU 2==3, pentru a putea citi si scrie in memorie
    movl $34,%esi # map_private==2 (suficient pentru ce avem nevoie), map_anonymus==0x20==32
    movl $-1,%edi # (map_anonymus)=> fd argument is ignored
    movl $0,%ebp # (map_anonymus)=> offset == 0
    int $0x80
    movl %eax,mres # adresa de la care a fost alocata memoria e returnata in %eax

INITIALIZARE_MATRICE:
    lea m,%edi
    movl mres,%esi
    mov $0,%ecx
    for_init1:
        cmp n,%ecx
        je CITIRE_DATE

        mov $0,%ebx
        for_init2:
            cmp n,%ebx
            je inapoi_forinit1

            # m[ecx][ebx] == m+ ecx*(n)+ebx
            mov %ecx,%eax
            mov $0,%edx
            mull n
            add %ebx,%eax

            mov $0, %edx
            mov %edx,(%edi,%eax,4)
            mov %edx, (%esi,%eax,4)
            incl %ebx

            jmp for_init2

        inapoi_forinit1:
            mov %ecx,%eax
            mov $0,%edx
            mull n
            add %ecx,%eax
            movl $1,(%esi,%eax,4)

            incl %ecx
            jmp for_init1

CITIRE_DATE:
    lea nrleg,%esi
    movl $0,%ecx
    for:
        cmp n,%ecx
        je continuam1

        pusha
        pushl $x
        pushl $fs1
        call scanf
        popl %ebx
        popl %ebx
        popa

        movl x,%ebx
        movl %ebx, (%esi,%ecx,4)
        incl %ecx
        jmp for

    continuam1:
        movl $0,%ecx
        lea nrleg,%esi
        lea m, %edi
        for1:
            cmp n,%ecx
            je aleg_cerinta

            movl (%esi,%ecx,4),%edx
            movl %edx,x

            movl $0,%ebx
            for2:
                cmp %ebx,x
                je inapoifor1

                pusha
                pushl $a
                pushl $fs1
                call scanf
                popl %edx
                popl %edx
                popa
                
                # m[ecx][a] == m+ ecx*(n) +a
                movl %ecx,%eax
                movl $0,%edx
                mull n
                addl a,%eax

                # update matrice
                movl $1, (%edi,%eax,4)

                incl %ebx
                jmp for2

            inapoifor1:
                incl %ecx
                jmp for1


 aleg_cerinta:
    movl cerinta,%eax
    cmp $3,%eax
    je cerinta3
    jmp exit
   
cerinta3:
Citire_date_suplimentare:
    pusha
    pushl $nod_dest
    pushl $nod_sursa
    pushl $k
    pushl $fs3
    call scanf
    popl %ebx
    popl %ebx
    popl %ebx
    popl %ebx
    popa
    

exponentiere:
    while_k:
       
        movl $1, %eax
        cmp %eax,k 
        jl prelucrare_mres

        movl k,%eax
        xor %edx,%edx
        movl $2,%ebx
        divl %ebx
        movl %eax,k

        cmp $1,%edx
        jne par

        impar:
            pusha
            pushl n
            pushl $aux
            pushl mres
            pushl $m
            call matrix_mult
            popl %ebx
            popl %ebx
            popl %ebx
            popl %ebx
            popa

            mres_egal_aux:
            lea aux,%esi
            movl mres,%edi
            xorl %ecx,%ecx
            linii: # ecx==i

                xorl %ebx,%ebx
                cmp n,%ecx
                je par
                coloane: # ebx ==j
                    
                    cmp n,%ebx
                    je afara_linii
                    
                    # m[ecx][ebx] == m+ ecx*n +ebx
                    mov %ecx,%eax
                    mov $0,%edx
                    mull n
                    add %ebx,%eax

                    movl (%esi,%eax,4),%edx
                    movl %edx,(%edi,%eax,4) # edi=esi // mres=aux

                    incl %ebx
                    jmp coloane
            afara_linii:
                incl %ecx
                jmp linii
        

        par:

            pusha
            pushl n
            pushl $aux
            pushl $m
            pushl $m
            call matrix_mult
            popl %ebx
            popl %ebx
            popl %ebx
            popl %ebx
            popa

            m_egal_aux:
            lea aux,%esi
            lea m,%edi
            xorl %ecx,%ecx
            linii2: # ecx==i
                xorl %ebx,%ebx
                cmp n,%ecx
                je afara_par
                coloane2: # ebx ==j
                    cmp n,%ebx
                    je afara_linii2
                    
                    # m[ecx][ebx] == m+ ecx*n +ebx
                    mov %ecx,%eax
                    mov $0,%edx
                    mull n
                    add %ebx,%eax

                    movl (%esi,%eax,4),%edx
                    movl %edx,(%edi,%eax,4) # edi=esi // mres=aux

                    incl %ebx
                    jmp coloane2
            afara_linii2:
                incl %ecx
                jmp linii2
        afara_par:
            jmp while_k


prelucrare_mres:
    
    # mres[nod_sursa][nod_dest]= mres + n*nod_sursa +nod_dest
    movl mres,%esi
    mov nod_sursa,%eax
    mov $0,%edx
    mull n
    add nod_dest,%eax
    movl (%esi,%eax,4),%ebx

    pusha
    pushl %ebx
    pushl $fs4
    call printf
    popl %ebx
    popl %ebx
    popa


iesire_c2:
    # movl mres,%edi
    # jmp afisare
    jmp dealocare_spatiu


afisare:
    # lea m,%edi
    mov $0,%ecx
    for_init11:
        cmp n,%ecx
        je dealocare_spatiu

        mov $0,%ebx
        for_init22:
            cmp n,%ebx
            je inapoi_forinit11

            # m[ecx][ebx] == m+ ecx*n +ebx
            mov %ecx,%eax
            mov $0,%edx
            mull n
            add %ebx,%eax

            mov (%edi,%eax,4),%edx

            # printf
            pusha
            pushl %edx
            pushl $fs2
            call printf
            popl %ebx
            popl %ebx
            popa

            incl %ebx
            jmp for_init22

        inapoi_forinit11:
            # newline
            pusha
            pushl $newline
            call printf
            popl %ebx
            popa

            incl %ecx
            jmp for_init11

dealocare_spatiu:
    movl $11,%eax # apelam syscall pentru munmap
    movl mres,%ebx # cele doua argumente sunt adresa de unde incepe memoria pe care vrem sa o eliberam
    movl dimensiune,%ecx # si dimenisunea ce trebuie eliberata (nu avem niciun offset)
    int $0x80

exit:
    pushl $0
    call fflush
    popl %ebx

    mov $1,%eax
    xor %ebx,%ebx
    int $0x80
