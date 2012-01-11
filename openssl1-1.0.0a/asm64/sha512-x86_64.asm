OPTION	DOTNAME
.text$	SEGMENT ALIGN(64) 'CODE'

PUBLIC	sha512_block_data_order

ALIGN	16
sha512_block_data_order	PROC PUBLIC
	mov	QWORD PTR[8+rsp],rdi	;WIN64 prologue
	mov	QWORD PTR[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_sha512_block_data_order::
	mov	rdi,rcx
	mov	rsi,rdx
	mov	rdx,r8
	mov	rcx,r9


	push	rbx
	push	rbp
	push	r12
	push	r13
	push	r14
	push	r15
	mov	r11,rsp
	shl	rdx,4
	sub	rsp,16*8+4*8
	lea	rdx,QWORD PTR[rdx*8+rsi]
	and	rsp,-64
	mov	QWORD PTR[((16*8+0*8))+rsp],rdi
	mov	QWORD PTR[((16*8+1*8))+rsp],rsi
	mov	QWORD PTR[((16*8+2*8))+rsp],rdx
	mov	QWORD PTR[((16*8+3*8))+rsp],r11
$L$prologue::

	lea	rbp,QWORD PTR[K512]

	mov	rax,QWORD PTR[((8*0))+rdi]
	mov	rbx,QWORD PTR[((8*1))+rdi]
	mov	rcx,QWORD PTR[((8*2))+rdi]
	mov	rdx,QWORD PTR[((8*3))+rdi]
	mov	r8,QWORD PTR[((8*4))+rdi]
	mov	r9,QWORD PTR[((8*5))+rdi]
	mov	r10,QWORD PTR[((8*6))+rdi]
	mov	r11,QWORD PTR[((8*7))+rdi]
	jmp	$L$loop

ALIGN	16
$L$loop::
	xor	rdi,rdi
	mov	r12,QWORD PTR[((8*0))+rsi]
	bswap	r12
	mov	r13,r8
	mov	r14,r8
	mov	r15,r9

	ror	r13,14
	ror	r14,18
	xor	r15,r10

	xor	r13,r14
	ror	r14,23
	and	r15,r8
	mov	QWORD PTR[rsp],r12

	xor	r13,r14
	xor	r15,r10
	add	r12,r11

	mov	r11,rax
	add	r12,r13

	add	r12,r15
	mov	r13,rax
	mov	r14,rax

	ror	r11,28
	ror	r13,34
	mov	r15,rax
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r11,r13
	ror	r13,5
	or	r14,rcx

	xor	r11,r13
	and	r15,rcx
	add	rdx,r12

	and	r14,rbx
	add	r11,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r11,r14
	mov	r12,QWORD PTR[((8*1))+rsi]
	bswap	r12
	mov	r13,rdx
	mov	r14,rdx
	mov	r15,r8

	ror	r13,14
	ror	r14,18
	xor	r15,r9

	xor	r13,r14
	ror	r14,23
	and	r15,rdx
	mov	QWORD PTR[8+rsp],r12

	xor	r13,r14
	xor	r15,r9
	add	r12,r10

	mov	r10,r11
	add	r12,r13

	add	r12,r15
	mov	r13,r11
	mov	r14,r11

	ror	r10,28
	ror	r13,34
	mov	r15,r11
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r10,r13
	ror	r13,5
	or	r14,rbx

	xor	r10,r13
	and	r15,rbx
	add	rcx,r12

	and	r14,rax
	add	r10,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r10,r14
	mov	r12,QWORD PTR[((8*2))+rsi]
	bswap	r12
	mov	r13,rcx
	mov	r14,rcx
	mov	r15,rdx

	ror	r13,14
	ror	r14,18
	xor	r15,r8

	xor	r13,r14
	ror	r14,23
	and	r15,rcx
	mov	QWORD PTR[16+rsp],r12

	xor	r13,r14
	xor	r15,r8
	add	r12,r9

	mov	r9,r10
	add	r12,r13

	add	r12,r15
	mov	r13,r10
	mov	r14,r10

	ror	r9,28
	ror	r13,34
	mov	r15,r10
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r9,r13
	ror	r13,5
	or	r14,rax

	xor	r9,r13
	and	r15,rax
	add	rbx,r12

	and	r14,r11
	add	r9,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r9,r14
	mov	r12,QWORD PTR[((8*3))+rsi]
	bswap	r12
	mov	r13,rbx
	mov	r14,rbx
	mov	r15,rcx

	ror	r13,14
	ror	r14,18
	xor	r15,rdx

	xor	r13,r14
	ror	r14,23
	and	r15,rbx
	mov	QWORD PTR[24+rsp],r12

	xor	r13,r14
	xor	r15,rdx
	add	r12,r8

	mov	r8,r9
	add	r12,r13

	add	r12,r15
	mov	r13,r9
	mov	r14,r9

	ror	r8,28
	ror	r13,34
	mov	r15,r9
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r8,r13
	ror	r13,5
	or	r14,r11

	xor	r8,r13
	and	r15,r11
	add	rax,r12

	and	r14,r10
	add	r8,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r8,r14
	mov	r12,QWORD PTR[((8*4))+rsi]
	bswap	r12
	mov	r13,rax
	mov	r14,rax
	mov	r15,rbx

	ror	r13,14
	ror	r14,18
	xor	r15,rcx

	xor	r13,r14
	ror	r14,23
	and	r15,rax
	mov	QWORD PTR[32+rsp],r12

	xor	r13,r14
	xor	r15,rcx
	add	r12,rdx

	mov	rdx,r8
	add	r12,r13

	add	r12,r15
	mov	r13,r8
	mov	r14,r8

	ror	rdx,28
	ror	r13,34
	mov	r15,r8
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rdx,r13
	ror	r13,5
	or	r14,r10

	xor	rdx,r13
	and	r15,r10
	add	r11,r12

	and	r14,r9
	add	rdx,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rdx,r14
	mov	r12,QWORD PTR[((8*5))+rsi]
	bswap	r12
	mov	r13,r11
	mov	r14,r11
	mov	r15,rax

	ror	r13,14
	ror	r14,18
	xor	r15,rbx

	xor	r13,r14
	ror	r14,23
	and	r15,r11
	mov	QWORD PTR[40+rsp],r12

	xor	r13,r14
	xor	r15,rbx
	add	r12,rcx

	mov	rcx,rdx
	add	r12,r13

	add	r12,r15
	mov	r13,rdx
	mov	r14,rdx

	ror	rcx,28
	ror	r13,34
	mov	r15,rdx
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rcx,r13
	ror	r13,5
	or	r14,r9

	xor	rcx,r13
	and	r15,r9
	add	r10,r12

	and	r14,r8
	add	rcx,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rcx,r14
	mov	r12,QWORD PTR[((8*6))+rsi]
	bswap	r12
	mov	r13,r10
	mov	r14,r10
	mov	r15,r11

	ror	r13,14
	ror	r14,18
	xor	r15,rax

	xor	r13,r14
	ror	r14,23
	and	r15,r10
	mov	QWORD PTR[48+rsp],r12

	xor	r13,r14
	xor	r15,rax
	add	r12,rbx

	mov	rbx,rcx
	add	r12,r13

	add	r12,r15
	mov	r13,rcx
	mov	r14,rcx

	ror	rbx,28
	ror	r13,34
	mov	r15,rcx
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rbx,r13
	ror	r13,5
	or	r14,r8

	xor	rbx,r13
	and	r15,r8
	add	r9,r12

	and	r14,rdx
	add	rbx,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rbx,r14
	mov	r12,QWORD PTR[((8*7))+rsi]
	bswap	r12
	mov	r13,r9
	mov	r14,r9
	mov	r15,r10

	ror	r13,14
	ror	r14,18
	xor	r15,r11

	xor	r13,r14
	ror	r14,23
	and	r15,r9
	mov	QWORD PTR[56+rsp],r12

	xor	r13,r14
	xor	r15,r11
	add	r12,rax

	mov	rax,rbx
	add	r12,r13

	add	r12,r15
	mov	r13,rbx
	mov	r14,rbx

	ror	rax,28
	ror	r13,34
	mov	r15,rbx
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rax,r13
	ror	r13,5
	or	r14,rdx

	xor	rax,r13
	and	r15,rdx
	add	r8,r12

	and	r14,rcx
	add	rax,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rax,r14
	mov	r12,QWORD PTR[((8*8))+rsi]
	bswap	r12
	mov	r13,r8
	mov	r14,r8
	mov	r15,r9

	ror	r13,14
	ror	r14,18
	xor	r15,r10

	xor	r13,r14
	ror	r14,23
	and	r15,r8
	mov	QWORD PTR[64+rsp],r12

	xor	r13,r14
	xor	r15,r10
	add	r12,r11

	mov	r11,rax
	add	r12,r13

	add	r12,r15
	mov	r13,rax
	mov	r14,rax

	ror	r11,28
	ror	r13,34
	mov	r15,rax
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r11,r13
	ror	r13,5
	or	r14,rcx

	xor	r11,r13
	and	r15,rcx
	add	rdx,r12

	and	r14,rbx
	add	r11,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r11,r14
	mov	r12,QWORD PTR[((8*9))+rsi]
	bswap	r12
	mov	r13,rdx
	mov	r14,rdx
	mov	r15,r8

	ror	r13,14
	ror	r14,18
	xor	r15,r9

	xor	r13,r14
	ror	r14,23
	and	r15,rdx
	mov	QWORD PTR[72+rsp],r12

	xor	r13,r14
	xor	r15,r9
	add	r12,r10

	mov	r10,r11
	add	r12,r13

	add	r12,r15
	mov	r13,r11
	mov	r14,r11

	ror	r10,28
	ror	r13,34
	mov	r15,r11
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r10,r13
	ror	r13,5
	or	r14,rbx

	xor	r10,r13
	and	r15,rbx
	add	rcx,r12

	and	r14,rax
	add	r10,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r10,r14
	mov	r12,QWORD PTR[((8*10))+rsi]
	bswap	r12
	mov	r13,rcx
	mov	r14,rcx
	mov	r15,rdx

	ror	r13,14
	ror	r14,18
	xor	r15,r8

	xor	r13,r14
	ror	r14,23
	and	r15,rcx
	mov	QWORD PTR[80+rsp],r12

	xor	r13,r14
	xor	r15,r8
	add	r12,r9

	mov	r9,r10
	add	r12,r13

	add	r12,r15
	mov	r13,r10
	mov	r14,r10

	ror	r9,28
	ror	r13,34
	mov	r15,r10
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r9,r13
	ror	r13,5
	or	r14,rax

	xor	r9,r13
	and	r15,rax
	add	rbx,r12

	and	r14,r11
	add	r9,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r9,r14
	mov	r12,QWORD PTR[((8*11))+rsi]
	bswap	r12
	mov	r13,rbx
	mov	r14,rbx
	mov	r15,rcx

	ror	r13,14
	ror	r14,18
	xor	r15,rdx

	xor	r13,r14
	ror	r14,23
	and	r15,rbx
	mov	QWORD PTR[88+rsp],r12

	xor	r13,r14
	xor	r15,rdx
	add	r12,r8

	mov	r8,r9
	add	r12,r13

	add	r12,r15
	mov	r13,r9
	mov	r14,r9

	ror	r8,28
	ror	r13,34
	mov	r15,r9
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r8,r13
	ror	r13,5
	or	r14,r11

	xor	r8,r13
	and	r15,r11
	add	rax,r12

	and	r14,r10
	add	r8,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r8,r14
	mov	r12,QWORD PTR[((8*12))+rsi]
	bswap	r12
	mov	r13,rax
	mov	r14,rax
	mov	r15,rbx

	ror	r13,14
	ror	r14,18
	xor	r15,rcx

	xor	r13,r14
	ror	r14,23
	and	r15,rax
	mov	QWORD PTR[96+rsp],r12

	xor	r13,r14
	xor	r15,rcx
	add	r12,rdx

	mov	rdx,r8
	add	r12,r13

	add	r12,r15
	mov	r13,r8
	mov	r14,r8

	ror	rdx,28
	ror	r13,34
	mov	r15,r8
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rdx,r13
	ror	r13,5
	or	r14,r10

	xor	rdx,r13
	and	r15,r10
	add	r11,r12

	and	r14,r9
	add	rdx,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rdx,r14
	mov	r12,QWORD PTR[((8*13))+rsi]
	bswap	r12
	mov	r13,r11
	mov	r14,r11
	mov	r15,rax

	ror	r13,14
	ror	r14,18
	xor	r15,rbx

	xor	r13,r14
	ror	r14,23
	and	r15,r11
	mov	QWORD PTR[104+rsp],r12

	xor	r13,r14
	xor	r15,rbx
	add	r12,rcx

	mov	rcx,rdx
	add	r12,r13

	add	r12,r15
	mov	r13,rdx
	mov	r14,rdx

	ror	rcx,28
	ror	r13,34
	mov	r15,rdx
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rcx,r13
	ror	r13,5
	or	r14,r9

	xor	rcx,r13
	and	r15,r9
	add	r10,r12

	and	r14,r8
	add	rcx,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rcx,r14
	mov	r12,QWORD PTR[((8*14))+rsi]
	bswap	r12
	mov	r13,r10
	mov	r14,r10
	mov	r15,r11

	ror	r13,14
	ror	r14,18
	xor	r15,rax

	xor	r13,r14
	ror	r14,23
	and	r15,r10
	mov	QWORD PTR[112+rsp],r12

	xor	r13,r14
	xor	r15,rax
	add	r12,rbx

	mov	rbx,rcx
	add	r12,r13

	add	r12,r15
	mov	r13,rcx
	mov	r14,rcx

	ror	rbx,28
	ror	r13,34
	mov	r15,rcx
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rbx,r13
	ror	r13,5
	or	r14,r8

	xor	rbx,r13
	and	r15,r8
	add	r9,r12

	and	r14,rdx
	add	rbx,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rbx,r14
	mov	r12,QWORD PTR[((8*15))+rsi]
	bswap	r12
	mov	r13,r9
	mov	r14,r9
	mov	r15,r10

	ror	r13,14
	ror	r14,18
	xor	r15,r11

	xor	r13,r14
	ror	r14,23
	and	r15,r9
	mov	QWORD PTR[120+rsp],r12

	xor	r13,r14
	xor	r15,r11
	add	r12,rax

	mov	rax,rbx
	add	r12,r13

	add	r12,r15
	mov	r13,rbx
	mov	r14,rbx

	ror	rax,28
	ror	r13,34
	mov	r15,rbx
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rax,r13
	ror	r13,5
	or	r14,rdx

	xor	rax,r13
	and	r15,rdx
	add	r8,r12

	and	r14,rcx
	add	rax,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rax,r14
	jmp	$L$rounds_16_xx
ALIGN	16
$L$rounds_16_xx::
	mov	r13,QWORD PTR[8+rsp]
	mov	r12,QWORD PTR[112+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[72+rsp]

	add	r12,QWORD PTR[rsp]
	mov	r13,r8
	mov	r14,r8
	mov	r15,r9

	ror	r13,14
	ror	r14,18
	xor	r15,r10

	xor	r13,r14
	ror	r14,23
	and	r15,r8
	mov	QWORD PTR[rsp],r12

	xor	r13,r14
	xor	r15,r10
	add	r12,r11

	mov	r11,rax
	add	r12,r13

	add	r12,r15
	mov	r13,rax
	mov	r14,rax

	ror	r11,28
	ror	r13,34
	mov	r15,rax
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r11,r13
	ror	r13,5
	or	r14,rcx

	xor	r11,r13
	and	r15,rcx
	add	rdx,r12

	and	r14,rbx
	add	r11,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r11,r14
	mov	r13,QWORD PTR[16+rsp]
	mov	r12,QWORD PTR[120+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[80+rsp]

	add	r12,QWORD PTR[8+rsp]
	mov	r13,rdx
	mov	r14,rdx
	mov	r15,r8

	ror	r13,14
	ror	r14,18
	xor	r15,r9

	xor	r13,r14
	ror	r14,23
	and	r15,rdx
	mov	QWORD PTR[8+rsp],r12

	xor	r13,r14
	xor	r15,r9
	add	r12,r10

	mov	r10,r11
	add	r12,r13

	add	r12,r15
	mov	r13,r11
	mov	r14,r11

	ror	r10,28
	ror	r13,34
	mov	r15,r11
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r10,r13
	ror	r13,5
	or	r14,rbx

	xor	r10,r13
	and	r15,rbx
	add	rcx,r12

	and	r14,rax
	add	r10,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r10,r14
	mov	r13,QWORD PTR[24+rsp]
	mov	r12,QWORD PTR[rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[88+rsp]

	add	r12,QWORD PTR[16+rsp]
	mov	r13,rcx
	mov	r14,rcx
	mov	r15,rdx

	ror	r13,14
	ror	r14,18
	xor	r15,r8

	xor	r13,r14
	ror	r14,23
	and	r15,rcx
	mov	QWORD PTR[16+rsp],r12

	xor	r13,r14
	xor	r15,r8
	add	r12,r9

	mov	r9,r10
	add	r12,r13

	add	r12,r15
	mov	r13,r10
	mov	r14,r10

	ror	r9,28
	ror	r13,34
	mov	r15,r10
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r9,r13
	ror	r13,5
	or	r14,rax

	xor	r9,r13
	and	r15,rax
	add	rbx,r12

	and	r14,r11
	add	r9,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r9,r14
	mov	r13,QWORD PTR[32+rsp]
	mov	r12,QWORD PTR[8+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[96+rsp]

	add	r12,QWORD PTR[24+rsp]
	mov	r13,rbx
	mov	r14,rbx
	mov	r15,rcx

	ror	r13,14
	ror	r14,18
	xor	r15,rdx

	xor	r13,r14
	ror	r14,23
	and	r15,rbx
	mov	QWORD PTR[24+rsp],r12

	xor	r13,r14
	xor	r15,rdx
	add	r12,r8

	mov	r8,r9
	add	r12,r13

	add	r12,r15
	mov	r13,r9
	mov	r14,r9

	ror	r8,28
	ror	r13,34
	mov	r15,r9
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r8,r13
	ror	r13,5
	or	r14,r11

	xor	r8,r13
	and	r15,r11
	add	rax,r12

	and	r14,r10
	add	r8,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r8,r14
	mov	r13,QWORD PTR[40+rsp]
	mov	r12,QWORD PTR[16+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[104+rsp]

	add	r12,QWORD PTR[32+rsp]
	mov	r13,rax
	mov	r14,rax
	mov	r15,rbx

	ror	r13,14
	ror	r14,18
	xor	r15,rcx

	xor	r13,r14
	ror	r14,23
	and	r15,rax
	mov	QWORD PTR[32+rsp],r12

	xor	r13,r14
	xor	r15,rcx
	add	r12,rdx

	mov	rdx,r8
	add	r12,r13

	add	r12,r15
	mov	r13,r8
	mov	r14,r8

	ror	rdx,28
	ror	r13,34
	mov	r15,r8
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rdx,r13
	ror	r13,5
	or	r14,r10

	xor	rdx,r13
	and	r15,r10
	add	r11,r12

	and	r14,r9
	add	rdx,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rdx,r14
	mov	r13,QWORD PTR[48+rsp]
	mov	r12,QWORD PTR[24+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[112+rsp]

	add	r12,QWORD PTR[40+rsp]
	mov	r13,r11
	mov	r14,r11
	mov	r15,rax

	ror	r13,14
	ror	r14,18
	xor	r15,rbx

	xor	r13,r14
	ror	r14,23
	and	r15,r11
	mov	QWORD PTR[40+rsp],r12

	xor	r13,r14
	xor	r15,rbx
	add	r12,rcx

	mov	rcx,rdx
	add	r12,r13

	add	r12,r15
	mov	r13,rdx
	mov	r14,rdx

	ror	rcx,28
	ror	r13,34
	mov	r15,rdx
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rcx,r13
	ror	r13,5
	or	r14,r9

	xor	rcx,r13
	and	r15,r9
	add	r10,r12

	and	r14,r8
	add	rcx,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rcx,r14
	mov	r13,QWORD PTR[56+rsp]
	mov	r12,QWORD PTR[32+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[120+rsp]

	add	r12,QWORD PTR[48+rsp]
	mov	r13,r10
	mov	r14,r10
	mov	r15,r11

	ror	r13,14
	ror	r14,18
	xor	r15,rax

	xor	r13,r14
	ror	r14,23
	and	r15,r10
	mov	QWORD PTR[48+rsp],r12

	xor	r13,r14
	xor	r15,rax
	add	r12,rbx

	mov	rbx,rcx
	add	r12,r13

	add	r12,r15
	mov	r13,rcx
	mov	r14,rcx

	ror	rbx,28
	ror	r13,34
	mov	r15,rcx
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rbx,r13
	ror	r13,5
	or	r14,r8

	xor	rbx,r13
	and	r15,r8
	add	r9,r12

	and	r14,rdx
	add	rbx,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rbx,r14
	mov	r13,QWORD PTR[64+rsp]
	mov	r12,QWORD PTR[40+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[rsp]

	add	r12,QWORD PTR[56+rsp]
	mov	r13,r9
	mov	r14,r9
	mov	r15,r10

	ror	r13,14
	ror	r14,18
	xor	r15,r11

	xor	r13,r14
	ror	r14,23
	and	r15,r9
	mov	QWORD PTR[56+rsp],r12

	xor	r13,r14
	xor	r15,r11
	add	r12,rax

	mov	rax,rbx
	add	r12,r13

	add	r12,r15
	mov	r13,rbx
	mov	r14,rbx

	ror	rax,28
	ror	r13,34
	mov	r15,rbx
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rax,r13
	ror	r13,5
	or	r14,rdx

	xor	rax,r13
	and	r15,rdx
	add	r8,r12

	and	r14,rcx
	add	rax,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rax,r14
	mov	r13,QWORD PTR[72+rsp]
	mov	r12,QWORD PTR[48+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[8+rsp]

	add	r12,QWORD PTR[64+rsp]
	mov	r13,r8
	mov	r14,r8
	mov	r15,r9

	ror	r13,14
	ror	r14,18
	xor	r15,r10

	xor	r13,r14
	ror	r14,23
	and	r15,r8
	mov	QWORD PTR[64+rsp],r12

	xor	r13,r14
	xor	r15,r10
	add	r12,r11

	mov	r11,rax
	add	r12,r13

	add	r12,r15
	mov	r13,rax
	mov	r14,rax

	ror	r11,28
	ror	r13,34
	mov	r15,rax
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r11,r13
	ror	r13,5
	or	r14,rcx

	xor	r11,r13
	and	r15,rcx
	add	rdx,r12

	and	r14,rbx
	add	r11,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r11,r14
	mov	r13,QWORD PTR[80+rsp]
	mov	r12,QWORD PTR[56+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[16+rsp]

	add	r12,QWORD PTR[72+rsp]
	mov	r13,rdx
	mov	r14,rdx
	mov	r15,r8

	ror	r13,14
	ror	r14,18
	xor	r15,r9

	xor	r13,r14
	ror	r14,23
	and	r15,rdx
	mov	QWORD PTR[72+rsp],r12

	xor	r13,r14
	xor	r15,r9
	add	r12,r10

	mov	r10,r11
	add	r12,r13

	add	r12,r15
	mov	r13,r11
	mov	r14,r11

	ror	r10,28
	ror	r13,34
	mov	r15,r11
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r10,r13
	ror	r13,5
	or	r14,rbx

	xor	r10,r13
	and	r15,rbx
	add	rcx,r12

	and	r14,rax
	add	r10,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r10,r14
	mov	r13,QWORD PTR[88+rsp]
	mov	r12,QWORD PTR[64+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[24+rsp]

	add	r12,QWORD PTR[80+rsp]
	mov	r13,rcx
	mov	r14,rcx
	mov	r15,rdx

	ror	r13,14
	ror	r14,18
	xor	r15,r8

	xor	r13,r14
	ror	r14,23
	and	r15,rcx
	mov	QWORD PTR[80+rsp],r12

	xor	r13,r14
	xor	r15,r8
	add	r12,r9

	mov	r9,r10
	add	r12,r13

	add	r12,r15
	mov	r13,r10
	mov	r14,r10

	ror	r9,28
	ror	r13,34
	mov	r15,r10
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r9,r13
	ror	r13,5
	or	r14,rax

	xor	r9,r13
	and	r15,rax
	add	rbx,r12

	and	r14,r11
	add	r9,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r9,r14
	mov	r13,QWORD PTR[96+rsp]
	mov	r12,QWORD PTR[72+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[32+rsp]

	add	r12,QWORD PTR[88+rsp]
	mov	r13,rbx
	mov	r14,rbx
	mov	r15,rcx

	ror	r13,14
	ror	r14,18
	xor	r15,rdx

	xor	r13,r14
	ror	r14,23
	and	r15,rbx
	mov	QWORD PTR[88+rsp],r12

	xor	r13,r14
	xor	r15,rdx
	add	r12,r8

	mov	r8,r9
	add	r12,r13

	add	r12,r15
	mov	r13,r9
	mov	r14,r9

	ror	r8,28
	ror	r13,34
	mov	r15,r9
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	r8,r13
	ror	r13,5
	or	r14,r11

	xor	r8,r13
	and	r15,r11
	add	rax,r12

	and	r14,r10
	add	r8,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	r8,r14
	mov	r13,QWORD PTR[104+rsp]
	mov	r12,QWORD PTR[80+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[40+rsp]

	add	r12,QWORD PTR[96+rsp]
	mov	r13,rax
	mov	r14,rax
	mov	r15,rbx

	ror	r13,14
	ror	r14,18
	xor	r15,rcx

	xor	r13,r14
	ror	r14,23
	and	r15,rax
	mov	QWORD PTR[96+rsp],r12

	xor	r13,r14
	xor	r15,rcx
	add	r12,rdx

	mov	rdx,r8
	add	r12,r13

	add	r12,r15
	mov	r13,r8
	mov	r14,r8

	ror	rdx,28
	ror	r13,34
	mov	r15,r8
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rdx,r13
	ror	r13,5
	or	r14,r10

	xor	rdx,r13
	and	r15,r10
	add	r11,r12

	and	r14,r9
	add	rdx,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rdx,r14
	mov	r13,QWORD PTR[112+rsp]
	mov	r12,QWORD PTR[88+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[48+rsp]

	add	r12,QWORD PTR[104+rsp]
	mov	r13,r11
	mov	r14,r11
	mov	r15,rax

	ror	r13,14
	ror	r14,18
	xor	r15,rbx

	xor	r13,r14
	ror	r14,23
	and	r15,r11
	mov	QWORD PTR[104+rsp],r12

	xor	r13,r14
	xor	r15,rbx
	add	r12,rcx

	mov	rcx,rdx
	add	r12,r13

	add	r12,r15
	mov	r13,rdx
	mov	r14,rdx

	ror	rcx,28
	ror	r13,34
	mov	r15,rdx
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rcx,r13
	ror	r13,5
	or	r14,r9

	xor	rcx,r13
	and	r15,r9
	add	r10,r12

	and	r14,r8
	add	rcx,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rcx,r14
	mov	r13,QWORD PTR[120+rsp]
	mov	r12,QWORD PTR[96+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[56+rsp]

	add	r12,QWORD PTR[112+rsp]
	mov	r13,r10
	mov	r14,r10
	mov	r15,r11

	ror	r13,14
	ror	r14,18
	xor	r15,rax

	xor	r13,r14
	ror	r14,23
	and	r15,r10
	mov	QWORD PTR[112+rsp],r12

	xor	r13,r14
	xor	r15,rax
	add	r12,rbx

	mov	rbx,rcx
	add	r12,r13

	add	r12,r15
	mov	r13,rcx
	mov	r14,rcx

	ror	rbx,28
	ror	r13,34
	mov	r15,rcx
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rbx,r13
	ror	r13,5
	or	r14,r8

	xor	rbx,r13
	and	r15,r8
	add	r9,r12

	and	r14,rdx
	add	rbx,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rbx,r14
	mov	r13,QWORD PTR[rsp]
	mov	r12,QWORD PTR[104+rsp]

	mov	r15,r13

	shr	r13,7
	ror	r15,1

	xor	r13,r15
	ror	r15,7

	xor	r13,r15
	mov	r14,r12

	shr	r12,6
	ror	r14,19

	xor	r12,r14
	ror	r14,42

	xor	r12,r14

	add	r12,r13

	add	r12,QWORD PTR[64+rsp]

	add	r12,QWORD PTR[120+rsp]
	mov	r13,r9
	mov	r14,r9
	mov	r15,r10

	ror	r13,14
	ror	r14,18
	xor	r15,r11

	xor	r13,r14
	ror	r14,23
	and	r15,r9
	mov	QWORD PTR[120+rsp],r12

	xor	r13,r14
	xor	r15,r11
	add	r12,rax

	mov	rax,rbx
	add	r12,r13

	add	r12,r15
	mov	r13,rbx
	mov	r14,rbx

	ror	rax,28
	ror	r13,34
	mov	r15,rbx
	add	r12,QWORD PTR[rdi*8+rbp]

	xor	rax,r13
	ror	r13,5
	or	r14,rdx

	xor	rax,r13
	and	r15,rdx
	add	r8,r12

	and	r14,rcx
	add	rax,r12

	or	r14,r15
	lea	rdi,QWORD PTR[1+rdi]

	add	rax,r14
	cmp	rdi,80
	jb	$L$rounds_16_xx

	mov	rdi,QWORD PTR[((16*8+0*8))+rsp]
	lea	rsi,QWORD PTR[((16*8))+rsi]

	add	rax,QWORD PTR[((8*0))+rdi]
	add	rbx,QWORD PTR[((8*1))+rdi]
	add	rcx,QWORD PTR[((8*2))+rdi]
	add	rdx,QWORD PTR[((8*3))+rdi]
	add	r8,QWORD PTR[((8*4))+rdi]
	add	r9,QWORD PTR[((8*5))+rdi]
	add	r10,QWORD PTR[((8*6))+rdi]
	add	r11,QWORD PTR[((8*7))+rdi]

	cmp	rsi,QWORD PTR[((16*8+2*8))+rsp]

	mov	QWORD PTR[((8*0))+rdi],rax
	mov	QWORD PTR[((8*1))+rdi],rbx
	mov	QWORD PTR[((8*2))+rdi],rcx
	mov	QWORD PTR[((8*3))+rdi],rdx
	mov	QWORD PTR[((8*4))+rdi],r8
	mov	QWORD PTR[((8*5))+rdi],r9
	mov	QWORD PTR[((8*6))+rdi],r10
	mov	QWORD PTR[((8*7))+rdi],r11
	jb	$L$loop

	mov	rsi,QWORD PTR[((16*8+3*8))+rsp]
	mov	r15,QWORD PTR[rsi]
	mov	r14,QWORD PTR[8+rsi]
	mov	r13,QWORD PTR[16+rsi]
	mov	r12,QWORD PTR[24+rsi]
	mov	rbp,QWORD PTR[32+rsi]
	mov	rbx,QWORD PTR[40+rsi]
	lea	rsp,QWORD PTR[48+rsi]
$L$epilogue::
	mov	rdi,QWORD PTR[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD PTR[16+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_sha512_block_data_order::
sha512_block_data_order	ENDP
ALIGN	64

K512::
	DQ	0428a2f98d728ae22h,07137449123ef65cdh
	DQ	0b5c0fbcfec4d3b2fh,0e9b5dba58189dbbch
	DQ	03956c25bf348b538h,059f111f1b605d019h
	DQ	0923f82a4af194f9bh,0ab1c5ed5da6d8118h
	DQ	0d807aa98a3030242h,012835b0145706fbeh
	DQ	0243185be4ee4b28ch,0550c7dc3d5ffb4e2h
	DQ	072be5d74f27b896fh,080deb1fe3b1696b1h
	DQ	09bdc06a725c71235h,0c19bf174cf692694h
	DQ	0e49b69c19ef14ad2h,0efbe4786384f25e3h
	DQ	00fc19dc68b8cd5b5h,0240ca1cc77ac9c65h
	DQ	02de92c6f592b0275h,04a7484aa6ea6e483h
	DQ	05cb0a9dcbd41fbd4h,076f988da831153b5h
	DQ	0983e5152ee66dfabh,0a831c66d2db43210h
	DQ	0b00327c898fb213fh,0bf597fc7beef0ee4h
	DQ	0c6e00bf33da88fc2h,0d5a79147930aa725h
	DQ	006ca6351e003826fh,0142929670a0e6e70h
	DQ	027b70a8546d22ffch,02e1b21385c26c926h
	DQ	04d2c6dfc5ac42aedh,053380d139d95b3dfh
	DQ	0650a73548baf63deh,0766a0abb3c77b2a8h
	DQ	081c2c92e47edaee6h,092722c851482353bh
	DQ	0a2bfe8a14cf10364h,0a81a664bbc423001h
	DQ	0c24b8b70d0f89791h,0c76c51a30654be30h
	DQ	0d192e819d6ef5218h,0d69906245565a910h
	DQ	0f40e35855771202ah,0106aa07032bbd1b8h
	DQ	019a4c116b8d2d0c8h,01e376c085141ab53h
	DQ	02748774cdf8eeb99h,034b0bcb5e19b48a8h
	DQ	0391c0cb3c5c95a63h,04ed8aa4ae3418acbh
	DQ	05b9cca4f7763e373h,0682e6ff3d6b2b8a3h
	DQ	0748f82ee5defb2fch,078a5636f43172f60h
	DQ	084c87814a1f0ab72h,08cc702081a6439ech
	DQ	090befffa23631e28h,0a4506cebde82bde9h
	DQ	0bef9a3f7b2c67915h,0c67178f2e372532bh
	DQ	0ca273eceea26619ch,0d186b8c721c0c207h
	DQ	0eada7dd6cde0eb1eh,0f57d4f7fee6ed178h
	DQ	006f067aa72176fbah,00a637dc5a2c898a6h
	DQ	0113f9804bef90daeh,01b710b35131c471bh
	DQ	028db77f523047d84h,032caab7b40c72493h
	DQ	03c9ebe0a15c9bebch,0431d67c49c100d4ch
	DQ	04cc5d4becb3e42b6h,0597f299cfc657e2ah
	DQ	05fcb6fab3ad6faech,06c44198c4a475817h
EXTERN	__imp_RtlVirtualUnwind:NEAR

ALIGN	16
se_handler	PROC PRIVATE
	push	rsi
	push	rdi
	push	rbx
	push	rbp
	push	r12
	push	r13
	push	r14
	push	r15
	pushfq
	sub	rsp,64

	mov	rax,QWORD PTR[120+r8]
	mov	rbx,QWORD PTR[248+r8]

	lea	r10,QWORD PTR[$L$prologue]
	cmp	rbx,r10
	jb	$L$in_prologue

	mov	rax,QWORD PTR[152+r8]

	lea	r10,QWORD PTR[$L$epilogue]
	cmp	rbx,r10
	jae	$L$in_prologue

	mov	rax,QWORD PTR[((16*8+3*8))+rax]
	lea	rax,QWORD PTR[48+rax]

	mov	rbx,QWORD PTR[((-8))+rax]
	mov	rbp,QWORD PTR[((-16))+rax]
	mov	r12,QWORD PTR[((-24))+rax]
	mov	r13,QWORD PTR[((-32))+rax]
	mov	r14,QWORD PTR[((-40))+rax]
	mov	r15,QWORD PTR[((-48))+rax]
	mov	QWORD PTR[144+r8],rbx
	mov	QWORD PTR[160+r8],rbp
	mov	QWORD PTR[216+r8],r12
	mov	QWORD PTR[224+r8],r13
	mov	QWORD PTR[232+r8],r14
	mov	QWORD PTR[240+r8],r15

$L$in_prologue::
	mov	rdi,QWORD PTR[8+rax]
	mov	rsi,QWORD PTR[16+rax]
	mov	QWORD PTR[152+r8],rax
	mov	QWORD PTR[168+r8],rsi
	mov	QWORD PTR[176+r8],rdi

	mov	rdi,QWORD PTR[40+r9]
	mov	rsi,r8
	mov	ecx,154
	DD	0a548f3fch		

	mov	rsi,r9
	xor	rcx,rcx
	mov	rdx,QWORD PTR[8+rsi]
	mov	r8,QWORD PTR[rsi]
	mov	r9,QWORD PTR[16+rsi]
	mov	r10,QWORD PTR[40+rsi]
	lea	r11,QWORD PTR[56+rsi]
	lea	r12,QWORD PTR[24+rsi]
	mov	QWORD PTR[32+rsp],r10
	mov	QWORD PTR[40+rsp],r11
	mov	QWORD PTR[48+rsp],r12
	mov	QWORD PTR[56+rsp],rcx
	call	QWORD PTR[__imp_RtlVirtualUnwind]

	mov	eax,1
	add	rsp,64
	popfq
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	pop	rbp
	pop	rbx
	pop	rdi
	pop	rsi
	DB	0F3h,0C3h		;repret
se_handler	ENDP

.text$	ENDS
.pdata	SEGMENT READONLY ALIGN(4)
ALIGN	4
	DD	imagerel $L$SEH_begin_sha512_block_data_order
	DD	imagerel $L$SEH_end_sha512_block_data_order
	DD	imagerel $L$SEH_info_sha512_block_data_order

.pdata	ENDS
.xdata	SEGMENT READONLY ALIGN(8)
ALIGN	8
$L$SEH_info_sha512_block_data_order::
DB	9,0,0,0
	DD	imagerel se_handler

.xdata	ENDS
END
