

.text
	jal ra,16
	sw s0,4(t0)
	 addi a7,zero,10
	 ecall
	  lui t0,0x10010 
	  lw s0,0(t0)
	  mul s0,s0,s0
	  andi s0,s0,1023 
	   blt t0,s0, -16
	   jalr x0,x1,0
	   ecall