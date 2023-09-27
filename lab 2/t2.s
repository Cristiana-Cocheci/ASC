.data
x: .long 0x80000000
y: .long 0x70000000
.text
.globl main
main:
	mov $0,%edx
	mov $47,%eax
	mov $15,%ebx
	div %ebx

	

exit:
	mov $1,%eax
	mov $0,%ebx
	int $0x80

/*
gcc -m32 t2.s -o t2 
*/
