.data 
	x: .long 432
	cnt: .long 0
.text
.globl main
main:
/*varianta lenta
verificare_bit:
	mov $0,%edx
	mov x,%eax
	mov $2,%ebx
	idiv %ebx
	cmp $1,%edx
	je inc_cnt
	
shiftare_dreapta:
	mov x,%ecx
	shr $1,%ecx
	mov %ecx,x
	cmp $0,%ecx
	je exit
	jmp verificare_bit
	
inc_cnt:
	mov cnt,%ebx
	add $1,%ebx
	mov %ebx,cnt	
	jmp shiftare_dreapta
*/ 
ult_bit_scos:
	mov x,%eax
	cmp $0,%eax
	je exit
	mov x,%ebx
	sub $1,%ebx
	and %ebx,%eax
	mov %eax,x
	mov cnt,%ecx
	add $1,%ecx
	mov %ecx,cnt
	jmp ult_bit_scos
	
exit:
	mov $1,%eax
	mov $0,%ebx
	int $0x80
