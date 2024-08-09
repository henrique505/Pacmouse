.text

MAIN:
    li a7, 5              # Serviço Read Int
    ecall                 # chamada do sistema, valor lido em a0
    jal SOMA              # chama o procedimento SOMA
    li a7, 1              # serviço de print int
    ecall                 # chamada do sistema
    li a7, 10             # Serviço de Exit
    ecall                 # chamada do sistema

# Procedimento SOMA
SOMA:
    mv s0, a0             # armazena o valor de a0 em s0
    slli s0, s0, 1        # multiplica s0 por 2 (s0 = 2 * a0)
    li s1, 0              # inicializa s1 com 0 (para armazenar a soma dos ímpares)
    li t0, 1              # inicializa o contador t0 com 1 (primeiro número ímpar)

LOOP:
    bge t0, s0, FIM     # se t0 >= 2 * a0, sai do loop
    add s1, s1, t0       # adiciona t0 (número ímpar atual) a s1
    addi t0, t0, 2       # incrementa t0 para o próximo número ímpar
    j LOOP               # volta para o início do loop

FIM:
    mv a0, s1            # move o resultado (soma dos ímpares) para a0 para ser impresso
    ret                  # retorna ao chamador
