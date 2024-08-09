.data

.word 0x00000016      # armazena a partir da memória 0x10010000
.word 0x00000004        # memória 0x10010000 + 4

.text
	jal ra, JUMP
	sw s0, 4(t0)
	addi a7,zero,10
	ecall
JUMP:	lui t0,0x10010
	lw s0,0(t0)
	add s0,s0,s0
	andi s0,s0,15
	blt t0,s0, JUMP
	jalr x0,x1,0