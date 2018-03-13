	.file	"main.c"
	.text
	.globl	sum
	.type	sum, @function
sum:
.LFB24:
	.cfi_startproc
	leal	(%rdi,%rsi), %eax
	ret
	.cfi_endproc
.LFE24:
	.size	sum, .-sum
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
