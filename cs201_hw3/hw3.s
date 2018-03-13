	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$40, %rsp
Ltmp6:
	.cfi_offset %rbx, -40
Ltmp7:
	.cfi_offset %r14, -32
Ltmp8:
	.cfi_offset %r15, -24
	movq	%rsi, %rbx
	cmpl	$2, %edi
	jne	LBB0_1
## BB#2:
	xorl	%r14d, %r14d
	leaq	-56(%rbp), %rdi
	xorl	%esi, %esi
	callq	_gettimeofday
	callq	_crcInit
	movq	8(%rbx), %rbx
	movq	%rbx, %rdi
	callq	_strlen
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_crcFast
	movzbl	%al, %r15d
	leaq	-40(%rbp), %rdi
	xorl	%esi, %esi
	callq	_gettimeofday
	imulq	$1000, -40(%rbp), %rax  ## imm = 0x3E8
	imulq	$-1000, -56(%rbp), %rbx ## imm = 0xFFFFFFFFFFFFFC18
	addq	%rax, %rbx
	leaq	L_.str1(%rip), %rdi
	xorl	%eax, %eax
	movl	%r15d, %esi
	callq	_printf
	imulq	$1000, %rbx, %rax       ## imm = 0x3E8
	movabsq	$4835703278458516699, %rcx ## imm = 0x431BDE82D7B634DB
	mulq	%rcx
	movq	%rdx, %rcx
	shrq	$18, %rcx
	leaq	L_.str2(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	movq	%rbx, %rdx
	callq	_printf
	jmp	LBB0_3
LBB0_1:
	leaq	L_str(%rip), %rdi
	callq	_puts
	movl	$1, %r14d
LBB0_3:
	movl	%r14d, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str1:                                ## @.str1
	.asciz	"CRC:%X\n"

L_.str2:                                ## @.str2
	.asciz	"Iterations: %lu, TotalTime : %lu ms, IterTime : %lu us\n"

	.align	4                       ## @str
L_str:
	.asciz	"Usage: hw2 message"


.subsections_via_symbols
