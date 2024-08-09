.data
.text
LABEL1:
  jal t, LABEL2
  sw s0, 4(t0)
  addi a7, zero, 10
  ecall

LABEL2:
  lui t0, 65552
  lw s0, 0(t0)
  add s0, s0, s0
  andi s0, s0, 15
  blt t0, s0, LABEL2
  jalr zero, 0(t0)
  ecall
