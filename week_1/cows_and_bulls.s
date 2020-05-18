	.file	"cows_and_bulls.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Do you want to play another game? [y/n]:"
.LC1:
	.string	"%c"
	.text
	.globl	anotherGame
	.type	anotherGame, @function
anotherGame:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L3:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	leaq	-9(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-9(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	cmpl	$121, %eax
	je	.L2
	movzbl	-9(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	cmpl	$110, %eax
	jne	.L3
.L2:
	movzbl	-9(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	cmpl	$121, %eax
	sete	%al
	movzbl	%al, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	anotherGame, .-anotherGame
	.section	.rodata
.LC2:
	.string	"Enter your guess: "
.LC3:
	.string	"%d"
	.text
	.globl	readGuess
	.type	readGuess, @function
readGuess:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$0, -4(%rbp)
	jmp	.L7
.L8:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	call	getchar@PLT
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jle	.L8
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$9, %eax
	jg	.L8
	addl	$1, -4(%rbp)
.L7:
	cmpl	$3, -4(%rbp)
	jle	.L8
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	readGuess, .-readGuess
	.globl	blackScore
	.type	blackScore, @function
blackScore:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L10
.L12:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L11
	addl	$1, -8(%rbp)
.L11:
	addl	$1, -4(%rbp)
.L10:
	cmpl	$3, -4(%rbp)
	jle	.L12
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	blackScore, .-blackScore
	.globl	whiteScore
	.type	whiteScore, @function
whiteScore:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L15
.L19:
	movl	$0, -4(%rbp)
	jmp	.L16
.L18:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	je	.L17
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L17
	addl	$1, -12(%rbp)
.L17:
	addl	$1, -4(%rbp)
.L16:
	cmpl	$3, -4(%rbp)
	jle	.L18
	addl	$1, -8(%rbp)
.L15:
	cmpl	$3, -8(%rbp)
	jle	.L19
	movl	-12(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	whiteScore, .-whiteScore
	.section	.rodata
.LC4:
	.string	"(%d,%d)\n"
	.text
	.globl	printScore
	.type	printScore, @function
printScore:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	whiteScore
	movl	%eax, %ebx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	blackScore
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	printScore, .-printScore
	.section	.rodata
.LC5:
	.string	"You have guessed correctly!"
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1, -96(%rbp)
	movl	$8, -92(%rbp)
	movl	$9, -88(%rbp)
	movl	$2, -84(%rbp)
	movl	$2, -80(%rbp)
	movl	$4, -76(%rbp)
	movl	$6, -72(%rbp)
	movl	$8, -68(%rbp)
	movl	$1, -64(%rbp)
	movl	$9, -60(%rbp)
	movl	$8, -56(%rbp)
	movl	$3, -52(%rbp)
	movl	$7, -48(%rbp)
	movl	$4, -44(%rbp)
	movl	$2, -40(%rbp)
	movl	$1, -36(%rbp)
	movl	$4, -32(%rbp)
	movl	$6, -28(%rbp)
	movl	$8, -24(%rbp)
	movl	$9, -20(%rbp)
	movl	$0, -120(%rbp)
	jmp	.L23
.L25:
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	readGuess
	leaq	-96(%rbp), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rax, %rdx
	leaq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	printScore
.L24:
	leaq	-96(%rbp), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rax, %rdx
	leaq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	blackScore
	cmpl	$4, %eax
	jne	.L25
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	cmpl	$3, -120(%rbp)
	jg	.L26
	call	anotherGame
	movl	%eax, -116(%rbp)
	cmpl	$0, -116(%rbp)
	je	.L32
.L26:
	addl	$1, -120(%rbp)
.L23:
	cmpl	$3, -120(%rbp)
	jle	.L24
	jmp	.L28
.L32:
	nop
.L28:
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L31
	call	__stack_chk_fail@PLT
.L31:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
