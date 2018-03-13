	.file	"c_mZLZOj"
	.text
	.p2align 2,,3
.globl _rvereseArray
	.def	_rvereseArray;	.scl	2;	.type	32;	.endef
_rvereseArray:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	movl	8(%ebp), %eax
	movl	12(%ebp), %edi
	movl	16(%ebp), %esi
	cmpl	%esi, %edi
	jge	L6
	leal	(%eax,%edi,4), %ebx
	leal	(%eax,%esi,4), %ecx
	.p2align 2,,3
L5:
	movl	(%ebx), %edx
	movl	(%ecx), %eax
	movl	%eax, (%ebx)
	movl	%edx, (%ecx)
	decl	%esi
	incl	%edi
	addl	$4, %ebx
	subl	$4, %ecx
	cmpl	%edi, %esi
	jg	L5
L6:
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
