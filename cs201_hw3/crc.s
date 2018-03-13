	.section	__TEXT,__text,regular,pure_instructions
	.section	__TEXT,__const
	.align	4
LCPI0_0:
	.long	0                       ## 0x0
	.long	1                       ## 0x1
	.long	2                       ## 0x2
	.long	3                       ## 0x3
LCPI0_1:
	.long	213                     ## 0xd5
	.long	213                     ## 0xd5
	.long	213                     ## 0xd5
	.long	213                     ## 0xd5
LCPI0_2:
	.byte	0                       ## 0x0
	.byte	4                       ## 0x4
	.byte	8                       ## 0x8
	.byte	12                      ## 0xc
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.byte	128                     ## 0x80
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_crcInit
	.align	4, 0x90
_crcInit:                               ## @crcInit
	.cfi_startproc
## BB#0:                                ## %vector.ph
	pushq	%rbp
Ltmp2:
	.cfi_def_cfa_offset 16
Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp4:
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	movdqa	LCPI0_0(%rip), %xmm0
	movdqa	LCPI0_1(%rip), %xmm1
	leaq	_crcTable(%rip), %rcx
	movdqa	LCPI0_2(%rip), %xmm2
	.align	4, 0x90
LBB0_1:                                 ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	movd	%eax, %xmm3
	pshufd	$0, %xmm3, %xmm4        ## xmm4 = xmm3[0,0,0,0]
	paddd	%xmm0, %xmm4
	pslld	$24, %xmm4
	pxor	%xmm3, %xmm3
	pcmpgtd	%xmm4, %xmm3
	psrad	$23, %xmm4
	movdqa	%xmm4, %xmm5
	pxor	%xmm1, %xmm5
	pand	%xmm3, %xmm5
	pandn	%xmm4, %xmm3
	por	%xmm5, %xmm3
	pslld	$24, %xmm3
	pxor	%xmm4, %xmm4
	pcmpgtd	%xmm3, %xmm4
	psrad	$23, %xmm3
	movdqa	%xmm4, %xmm5
	pandn	%xmm3, %xmm5
	pxor	%xmm1, %xmm3
	pand	%xmm4, %xmm3
	por	%xmm5, %xmm3
	pslld	$24, %xmm3
	pxor	%xmm4, %xmm4
	pcmpgtd	%xmm3, %xmm4
	psrad	$23, %xmm3
	movdqa	%xmm4, %xmm5
	pandn	%xmm3, %xmm5
	pxor	%xmm1, %xmm3
	pand	%xmm4, %xmm3
	por	%xmm5, %xmm3
	pslld	$24, %xmm3
	pxor	%xmm4, %xmm4
	pcmpgtd	%xmm3, %xmm4
	psrad	$23, %xmm3
	movdqa	%xmm4, %xmm5
	pandn	%xmm3, %xmm5
	pxor	%xmm1, %xmm3
	pand	%xmm4, %xmm3
	por	%xmm5, %xmm3
	pslld	$24, %xmm3
	pxor	%xmm4, %xmm4
	pcmpgtd	%xmm3, %xmm4
	psrad	$23, %xmm3
	movdqa	%xmm4, %xmm5
	pandn	%xmm3, %xmm5
	pxor	%xmm1, %xmm3
	pand	%xmm4, %xmm3
	por	%xmm5, %xmm3
	pslld	$24, %xmm3
	pxor	%xmm4, %xmm4
	pcmpgtd	%xmm3, %xmm4
	psrad	$23, %xmm3
	movdqa	%xmm4, %xmm5
	pandn	%xmm3, %xmm5
	pxor	%xmm1, %xmm3
	pand	%xmm4, %xmm3
	por	%xmm5, %xmm3
	pslld	$24, %xmm3
	pxor	%xmm4, %xmm4
	pcmpgtd	%xmm3, %xmm4
	psrad	$23, %xmm3
	movdqa	%xmm4, %xmm5
	pandn	%xmm3, %xmm5
	pxor	%xmm1, %xmm3
	pand	%xmm4, %xmm3
	por	%xmm5, %xmm3
	pslld	$24, %xmm3
	pxor	%xmm4, %xmm4
	pcmpgtd	%xmm3, %xmm4
	psrad	$23, %xmm3
	movdqa	%xmm4, %xmm5
	pandn	%xmm3, %xmm5
	pxor	%xmm1, %xmm3
	pand	%xmm4, %xmm3
	por	%xmm5, %xmm3
	pshufb	%xmm2, %xmm3
	movd	%xmm3, (%rax,%rcx)
	addq	$4, %rax
	cmpq	$256, %rax              ## imm = 0x100
	jne	LBB0_1
## BB#2:                                ## %middle.block
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_crcFast
	.align	4, 0x90
_crcFast:                               ## @crcFast
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp7:
	.cfi_def_cfa_offset 16
Ltmp8:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp9:
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	testq	%rsi, %rsi
	jle	LBB1_3
## BB#1:
	leaq	_crcTable(%rip), %rcx
	.align	4, 0x90
LBB1_2:                                 ## %.lr.ph
                                        ## =>This Inner Loop Header: Depth=1
	xorb	(%rdi), %al
	movzbl	%al, %eax
	movb	(%rax,%rcx), %al
	incq	%rdi
	decq	%rsi
	jne	LBB1_2
LBB1_3:                                 ## %._crit_edge
	movsbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc

.zerofill __DATA,__bss,_crcTable,256,4  ## @crcTable

.subsections_via_symbols
