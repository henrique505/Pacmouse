#################################################################	
#							        #
#	Universidade de Brasilia				#
# 	Instituto de Ciencias Exatas		       		#
# 	Departamento de Ciencia da Computacao	       		#
# 	Introducao aos Sistemas Computacionais - 2024.1		#
# 	Professor: Marcus Vinicius Lamar			#
# 	Alunos: Gabriel Alexandre, Henrique Almeida e Nyvea     #
# 	Paulla Tavares				   		#
# 	Jogo: Pacmouse						#
#								#
#################################################################
.data

#MAPAS
.include "./arquivos .data/levels/level1/labirinto1hud.data"
.include "./arquivos .data/levels/level2/labirinto2hud.data"

#COLISAO DOS MAPAS, COLETAVEIS E INIMIGOS
.include "./arquivos .data/levels/level1/level1_coletaveis.data"
.include "./arquivos .data/levels/level1/level1_colisao_inimigos.data"
.include "./arquivos .data/levels/level1/level1_colisao_parede.data"
.include "./arquivos .data/levels/level2/level2_coletaveis.data"
.include "./arquivos .data/levels/level2/level2_colisao_inimigos.data"
.include "./arquivos .data/levels/level2/level2_colisao_parede.data"

#COLETAVEIS
.include "./arquivos .data/collectibles/banana.data"
.include "./arquivos .data/collectibles/coletaveis.data"
.include "./arquivos .data/collectibles/melancia.data"
.include "./arquivos .data/collectibles/morango.data"
.include "./arquivos .data/collectibles/pera.data"
.include "./arquivos .data/collectibles/queijopoderoso.data"

#CHAR
.include "./arquivos .data/char/char.data"
.include "./arquivos .data/char/charD.data"
#NUMEROS
.include "./arquivos .data/numbers/um.data"
.include "./arquivos .data/numbers/dois.data"
.include "./arquivos .data/numbers/tres.data"

#INIMIGOS
.include "./arquivos .data/enemies/gato1A.data"
.include "./arquivos .data/enemies/gato1D.data"
.include "./arquivos .data/enemies/gato2A.data"
.include "./arquivos .data/enemies/gato2D.data"
.include "./arquivos .data/enemies/gato3A.data"
.include "./arquivos .data/enemies/gato3D.data"
.include "./arquivos .data/enemies/gato4A.data"
.include "./arquivos .data/enemies/gato4D.data"
.include "./arquivos .data/enemies/gatoassustadoA.data"
.include "./arquivos .data/enemies/gatoassustadoD.data"

# Define constantes para as direcoes
LEFT:           .half 1         # valor da direcao esquerda
RIGHT:          .half 2         # valor da direcao direita
DOWN:           .half 3         # valor da direcao baixo
UP:             .half 4         # valor da direcao cima

# Dados do jogo
PONTOS:        .word 0            # pontos atuais do jogador
RECORDE:       .word 0            # recorde do jogador
VIDAS:         .word 3            # vidas que o jogador tem
VIDAS_POS:     .half 16, 208      # posicao onde printar a quantidade de vidas
CURRENT_DIR:   .half 0            # direcao atual (0 = parado, 1 = esquerda, 2 = direita, 3 = baixo, 4 = cima)
WANTED_DIR:    .half 0            # direcao desejada

CHAR_POS:      .half 176, 208     # x, y
OLD_CHAR_POS:  .half 0, 0         # x, y

# Dados musica
Tamanho:			# Quantas notas serao tocadas
.word 365

Notas:				# Array com o tom de cada nota
.word 67,67,67,67,67,67,67,67,67,67,67,67,55,57,58,60,62,63,62,67,67,58,67,67,55,67,67,67,67,67,67,67,67,67,67,67,55,57,58,60,62,63,62,67,
67,58,67,67,55,67,67,67,67,67,67,67,67,67,67,67,60,67,69,67,69,67,69,67,69,61,69,67,62,67,70,67,70,67,62,66,69,66,69,66,55,67,79,67,
79,67,79,67,79,67,79,67,55,57,58,60,62,63,62,67,79,58,67,79,55,67,79,67,79,67,79,67,79,67,79,67,55,57,58,60,62,63,62,67,79,58,67,79,
55,67,79,67,79,67,79,67,79,67,79,67,60,67,69,67,69,67,69,67,69,67,69,67,61,67,70,67,70,67,70,67,70,61,61,61,62,66,67,69,70,73,74,62,
62,81,62,62,82,62,70,62,70,81,62,70,79,62,70,81,66,67,69,70,73,74,62,62,81,62,62,82,62,70,62,70,79,70,62,70,62,86,66,67,69,70,73,74,
57,66,57,66,57,57,66,57,66,57,66,57,66,57,74,57,66,74,55,65,55,65,55,65,55,65,79,55,65,79,63,72,63,72,75,60,60,72,63,63,77,62,65,62,
65,60,63,60,67,60,60,70,60,62,63,65,66,65,64,63,70,60,59,75,58,66,58,66,58,67,67,67,69,63,58,72,60,62,70,65,66,65,64,63,70,60,59,75,
58,66,58,66,58,67,67,67,69,63,58,72,60,62,70,65,66,65,64,63,82,60,59,86,62,64,66,67,68,69,68,67,81,64,62,82,67,69,70,67,65,63,63,65,
79,63,62,79,62,63,62,60,78,62,61,58,57

Duracao:			# Array com a duracao de cada nota correspondente
.word 125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,
125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,
125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,
125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,
125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,
125,125,125,125,125,250,125,125,125,125,125,125,125,250,125,125,125,125,125,125,125,125,125,125,125,125,125,125,250,125,125,125,125,125,125,
125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,
125,125,125,125,250,125,125,125,125,125,125,125,125,125,125,250,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,
125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,
125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,
125,125,125,125,125,250,125,125,125,125,250,125,125,125,125

NotaAtual:			# Ponteiro para ambos nota e duracao
.word 0
Fim:				# Define quando a nota deve parar de tocar
.word 0
	
.text
SETUP:	
		# armazena em 'Fim' a quantidade de milissegundos atual
		li a7, 30
		ecall
		sw a0, Fim, t0
			
		la a4,labirinto1		# carrega o endereco do sprite 'labirinto1' em a4
		li a1,0				# x = 0
		li a2,0				# y = 0
		li a3,0				# frame = 0
		call PRINT			# imprime o sprite
		la a4,labirinto1		# carrega o endereco do sprite 'labirinto1' em a4
		li a1,0				# x = 0
		li a2,0				# y = 0
		li a3,1				# frame = 1
		call PRINT			# imprime o sprite
		la a4, charD 			#carrega o chaD em a4 para aparecer na tela		
		# esse setup serve pra desenhar o fundo nos dois frames antes do "jogo" comecar
		
GAME_LOOP:	
	MUSICA:	
		FIM_NOTA:				# checa se a nota chegou ao fim
		li a7, 30				
		ecall					# armazena em a0 o tempo em milissegundos desde 1970 ate o momento atual
		lw t5, Fim
		blt a0, t5, NAO_ACABOU			# se o tempo atual for menos que o armazenado, pula para a main do jogo
		
		TOCA_NOTA:
		# carregar as informacoes do aquivo na memoria
		lw	t4, Tamanho		# quantas notas tem a musica
		li 	t0, 4			# carrega 4 em t0
		mul 	t4, t4, t0		# multiplica o tamanho por 4, por se tratar de uma word
		lw	t0, NotaAtual		# ponteiro para as notas e duracoes
		la	t1, Notas		# carrega o endereco das notas em t1
		la	t2, Duracao		# carrega o endereco das duracoes em t2
		
		# carregar as informacoes nos ponteiros
		add	t1, t1, t0	# t1 contem o endereco da nota atual
		lw	t1, 0(t1)	# t1 agora eh a nota atual
		add	t2, t2, t0 	# t2 contem o endereco da duracao da nota atual
		lw	t2, 0(t2) 	# t2 agora eh a nota atual
		
		# prepar para a ecall midi
		li	a7, 31 		# midi syscall
		mv	a0, t1 		# move a tonalidade para a0
		mv	a1, t2 		# move a duracao para a1
		li	a2, 1 		# define instrumento 
		li	a3, 100 	# volume
		ecall
	
		li	a7, 30		# pega o tempo atual em milissegundos
		ecall
		
		# calcular quando eh o fim da nota que esta tocando
		add	t6, a0, t2 			# t6 tem o comeco da nota + duracao
		sw 	t6, Fim, s2			# armazena o valor em Fim	
			
		lw	s3, NotaAtual		# s0 eh como um contador para a nota atual
		addi	s3, s3, 4		# incrementa 4 no contador (para ir para a proxima nota)
		bge	s3, t4, loop		# se a musica terminou, volta pro inicio
		j	jogo
		loop:
			li	s3, 0			# resseta o contador
		jogo:
			sw	s3, NotaAtual, s1	# novo valor no ponteiro para o arquivo na memoria
		
	NAO_ACABOU:
		call KEY2			# chama o procedimento de entrada do teclado
		
		xori s0,s0,1			# inverte o valor frame atual (somente o registrador)
		
		la t0,CHAR_POS			# carrega em t0 o endereco de CHAR_POS

		lh a1,0(t0)			# carrega a posicao x do personagem em a1
		lh a2,2(t0)			# carrega a posicao y do personagem em a2

		# Verificação de coordenadas
		li t3,48			# carrega 48 em t3
		li t4,112			# carrega 112 em t4
		beq a1,t3,CHECK_Y_48		# verifica se x == 48, se sim, vai para CHECK_Y_48
		j CHECK_304			# se não, vai para CHECK_304

CHECK_Y_48:
		beq a2,t4,INVERT_TO_304		# verifica se y == 112, se sim, inverte para 304
		j CONTINUE_LOOP			# se não, continua o loop

CHECK_304:
		li t3,304			# carrega 304 em t3
		beq a1,t3,CHECK_Y_304		# verifica se x == 304, se sim, vai para CHECK_Y_304
		j CONTINUE_LOOP			# se não, continua o loop

CHECK_Y_304:
		beq a2,t4,INVERT_TO_48		# verifica se y == 112, se sim, inverte para 48

CONTINUE_LOOP:
		mv a3,s0			# carrega o valor do frame em a3
		call PRINT			# imprime o sprite
		
		la t0,OLD_CHAR_POS		# carrega em t0 o endereco de OLD_CHAR_POS
		lh a1,0(t0)			# carrega a posicao x antiga do personagem em a1
		lh a2,2(t0)			# carrega a posicao y antiga do personagem em a2
		call ERASE			# chama a label que apaga o "rastro" do char
		
		li t0,0xFF200604		# carrega em t0 o endereco de troca de frame
		sw s0,0(t0)			# mostra o sprite pronto para o usuario
		
		j GAME_LOOP			# continua o loop

		INVERT_TO_304:
		li a1,304			# carrega 304 em a1
		sh a1,0(t0)			# atualiza a posição x para 304
		li t3,16			# carrega 16 em t3
		sub a1,a1,t3			# move um quadrado para trás (304 - 16)
		sh a1,0(t0)			# atualiza a posição x para 288
		j CONTINUE_LOOP			# continua o loop

		INVERT_TO_48:
		li a1,48			# carrega 48 em a1
		sh a1,0(t0)			# atualiza a posição x para 48
		li t3,16			# carrega 16 em t3
		add a1,a1,t3			# move um quadrado para frente (48 + 16)
		sh a1,0(t0)			# atualiza a posição x para 64
		j CONTINUE_LOOP			# continua o loop

KEY2:		li t1,0xFF200000		# carrega o endereco de controle do KDMMIO
		lw t0,0(t1)			# le o bit de controle do teclado
		andi t0,t0,0x0001		# mascara o bit menos significativo
   		beq t0,zero,FIM   		# se nao ha tecla pressionada, vai para FIM
  		
  		lw t2,4(t1)  			# le o valor da tecla pressionada
		
		li t0,'w'			# carrega 'w' em t0
		beq t2,t0,CHAR_CIMA		# se tecla pressionada for 'w', chama CHAR_CIMA
		
		li t0,'a'			# carrega 'a' em t0
		beq t2,t0,CHAR_ESQ		# se tecla pressionada for 'a', chama CHAR_ESQ
		
		li t0,'s'			# carrega 's' em t0
		beq t2,t0,CHAR_BAIXO		# se tecla pressionada for 's', chama CHAR_BAIXO
		
		li t0,'d'			# carrega 'd' em t0
		beq t2,t0,CHAR_DIR		# se tecla pressionada for 'd', chama CHAR_DIR
	
FIM:		ret				# retorna

CHAR_ESQ:	la t0,CHAR_POS			# carrega em t0 o endereco de CHAR_POS
		la t1,OLD_CHAR_POS		# carrega em t1 o endereco de OLD_CHAR_POS
		lw t2,0(t0)			# carrega a posicao atual do personagem em t2
		sw t2,0(t1)			# salva a posicao atual do personagem em OLD_CHAR_POS
		
		lh t1,0(t0)			# carrega o x atual do personagem
		addi t1,t1,-16			# decrementa 16 pixels
		sh t1,0(t0)			# salva a nova posicao x em CHAR_POS
		la a4, char			# carrega o endereco do sprite 'char' em a4
		ret				# retorna

CHAR_DIR:	la t0,CHAR_POS			# carrega em t0 o endereco de CHAR_POS
		la t1,OLD_CHAR_POS		# carrega em t1 o endereco de OLD_CHAR_POS
		lw t2,0(t0)			# carrega a posiÃ§Ã£o atual do personagem em t2
		sw t2,0(t1)			# salva a posicao atual do personagem em OLD_CHAR_POS
		
		lh t2, 0(t0)                	# carrega o x atual do personagem
        	addi t2, t2, 16             	# incrementa 16 pixels
        	sh t2, 0(t0)                	# salva a nova posiÃ§Ã£o x em CHAR_POS
        	la a4, charD                	# carrega o endereco do sprite 'charD' em a4
        	ret				# retorna

CHAR_CIMA:	la t0,CHAR_POS			# carrega em t0 o endereco de CHAR_POS
		la t1,OLD_CHAR_POS		# carrega em t1 o endereco de OLD_CHAR_POS
		lw t2,0(t0)			# carrega a posicao atual do personagem em t2
		sw t2,0(t1)			# salva a posicao atual do personagem em OLD_CHAR_POS
		
		la t0,CHAR_POS
		lh t1,2(t0)			# carrega o y atual do personagem
		addi t1,t1,-16			# decrementa 16 pixels
		sh t1,2(t0)			# salva a nova posiÃ§Ã£o y em CHAR_POS
		ret				# retorna

CHAR_BAIXO:	la t0,CHAR_POS			# carrega em t0 o endereco de CHAR_POS
		la t1,OLD_CHAR_POS		# carrega em t1 o endereco de OLD_CHAR_POS
		lw t2,0(t0)			# carrega a posicao atual do personagem em t2
		sw t2,0(t1)			# salva a posicao atual do personagem em OLD_CHAR_POS
		
		la t0,CHAR_POS
		lh t1,2(t0)			# carrega o y atual do personagem
		addi t1,t1,16			# incrementa 16 pixels
		sh t1,2(t0)			# salva a nova posiÃ§Ã£o y em CHAR_POS
		ret				# retorna		

#################################################
#	a1 = x					#
#	a2 = y					#
#	a3 = frame (0 ou 1)			#
#	a4 = endereco da imagem			#
#################################################
#	t0 = endereco do bitmap display		#
#	t1 = endereco da imagem			#
#	t2 = contador de linha			#
# 	t3 = contador de coluna			#
#	t4 = largura				#
#	t5 = altura				#
#################################################

PRINT:		li t0,0xFF0			# carrega 0xFF0 em t0
		add t0,t0,a3			# adiciona o frame ao FF0 (se o frame for 1 vira FF1, se for 0 fica FF0)
		slli t0,t0,20			# shift de 20 bits pra esquerda (0xFF0 vira 0xFF000000, 0xFF1 vira 0xFF100000)
		
		add t0,t0,a1			# adiciona x ao t0
		
		li t1,320			# t1 = 320
		mul t1,t1,a2			# t1 = 320 * y
		add t0,t0,t1			# adiciona t1 ao t0
		
		addi t1,a4,8			# t1 = a4 + 8
		
		mv t2,zero			# zera t2
		mv t3,zero			# zera t3
		
		lw t4,0(a4)			# carrega a largura em t4
		lw t5,4(a4)			# carrega a altura em t5
		
PRINT_LINHA:	lw t6,0(t1)			# carrega em t6 uma word (4 pixels) da imagem
		sw t6,0(t0)			# imprime no bitmap a word (4 pixels) da imagem
		
		addi t0,t0,4			# incrementa endereco do bitmap
		addi t1,t1,4			# incrementa endereco da imagem
		
		addi t3,t3,4			# incrementa contador de coluna
		blt t3,t4,PRINT_LINHA		# se contador da coluna < largura, continue imprimindo

		addi t0,t0,320			# t0 += 320
		sub t0,t0,t4			# t0 -= largura da imagem
		#  isso serve pra "pular" de linha no bitmap display
		
		mv t3,zero			# zera t3 (contador de coluna)
		addi t2,t2,1			# incrementa contador de linha
		bgt t5,t2,PRINT_LINHA		# se altura > contador de linha, continue imprimindo
		
		ret				# retorna

  		#####################################
		# Limpeza do "rastro" do personagem #
		#####################################
		
ERASE:		# a1 = x, a2 = y
		li t0,0xFF0			# carrega 0xFF0 em t0
		add t0,t0,a3			# adiciona o frame ao FF0 (se o frame for 1 vira FF1, se for 0 fica FF0)
		slli t0,t0,20			# shift de 20 bits pra esquerda (0xFF0 vira 0xFF000000, 0xFF1 vira 0xFF100000)
		
		# adiciona x ao t0
		li t1,320			# t1 = 320
		mul t1,t1,a2			# t1 = 320 * y
		add t1,t1,a1 			# t1 = (320 * y) + x / adiciona x ao t1
		add t0,t0,t1			# adiciona t1 ao t0
		# t0 agora eh nosso endereco do ponto na tela
		
		la t2, labirinto1		# carrega o endereco do labirinto1 em t2
		addi t2, t2, 8			# ajusta o ponteiro para a imagem
		# t0 eh o nosso enderecoo, t2 eh o ponteiro do fundo
		add t2, t2, t1			# ajusta o ponteiro do fundo

		li s1, 0			# contador de Y
		li s2, 0			# contador de X
		li s3, 16			# limite de pixels a serem apagados
		
		LOOP_Y:				# loop para linhas
		 li s2, 0                   # contador de X (colunas)
			LOOP_X:			# loop para colunas
				 lh t3, 0(t2)               # carrega a halfword de 4 pixels do fundo em t3
  				 sh t3, 0(t0)               # escreve os 4 pixels no bitmap na posicao antiga
    				 addi t2, t2, 1             # incrementa o endereco da imagem (fundo)
    				 addi t0, t0, 1             # incrementa o endereco do bitmap (posicao antiga)
    				 addi s2, s2, 1             # incrementa o contador de colunas
        			 blt s2, s3, LOOP_X         # se nao alcancou o limite de pixels, repete o loop de colunas
				
			LOOP_X_END: 
			   addi t0, t0, 304           # move o endereco do bitmap para a proxima linha (320 bytes)
  			  addi t2, t2, 304           # move o ponteiro do fundo para a proxima linha
    			addi s1, s1, 1             # incrementa o contador de linhas
    			blt s1, s3, LOOP_Y         # repete o loop de linhas ate o limite (16 pixels)
		LOOP_Y_END: 
		ret 				# retorna
