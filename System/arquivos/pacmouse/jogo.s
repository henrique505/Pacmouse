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

# Define constantes para as direções
LEFT:           .half 1         # valor da direção esquerda
RIGHT:          .half 2         # valor da direção direita
DOWN:           .half 3         # valor da direção baixo
UP:             .half 4         # valor da direção cima

# Dados do jogo
PONTOS:        .word 0            # pontos atuais do jogador
RECORDE:       .word 0            # recorde do jogador
VIDAS:         .word 3            # vidas que o jogador tem
VIDAS_POS:     .half 16, 208      # posição onde printar a quantidade de vidas
CURRENT_DIR:   .half 0            # direção atual (0 = parado, 1 = esquerda, 2 = direita, 3 = baixo, 4 = cima)
WANTED_DIR:    .half 0            # direção desejada

CHAR_POS:      .half 176, 208     # x, y
OLD_CHAR_POS:  .half 0, 0         # x, y

.text
SETUP:		la a0,labirinto1			# carrega o endereco do sprite 'labirinto1' em a0
		li a1,0				# x = 0
		li a2,0				# y = 0
		li a3,0				# frame = 0
		call PRINT			# imprime o sprite
		li a3,1				# frame = 1
		call PRINT			# imprime o sprite
		la a0, charD 			# carrega o chaD em a0 para aparecer na tela
		# esse setup serve pra desenhar o fundo nos dois frames antes do "jogo" comecar

GAME_LOOP:	
		# Transfere a posição atual para OLD_CHAR_POS
		la t0, CHAR_POS          # carrega o endereço de CHAR_POS
		la t1, OLD_CHAR_POS      # carrega o endereço de OLD_CHAR_POS
		lh t2, 0(t0)             # carrega o x atual do personagem em t2
		lh t3, 2(t0)             # carrega o y atual do personagem em t3
		sh t2, 0(t1)             # salva a posição x atual em OLD_CHAR_POS
		sh t3, 2(t1)             # salva a posição y atual em OLD_CHAR_POS

		call KEY2				# chama o procedimento de entrada do teclado
		
		xori s0,s0,1				# inverte o valor frame atual (somente o registrador)
		
		call MOVE_CHAR           	# movimenta o personagem baseado na direção desejada e na direção atual

		# Verificação de coordenadas
		li t3,48				# carrega 48 em t3
		li t4,112				# carrega 112 em t4
		beq a1,t3,CHECK_Y_48		# verifica se x == 48, se sim, vai para CHECK_Y_48
		j CHECK_304				# se não, vai para CHECK_304

CHECK_Y_48:
		beq a2,t4,INVERT_TO_304		# verifica se y == 112, se sim, inverte para 304
		j CONTINUE_LOOP			# se não, continua o loop

CHECK_304:
		li t3,304				# carrega 304 em t3
		beq a1,t3,CHECK_Y_304		# verifica se x == 304, se sim, vai para CHECK_Y_304
		j CONTINUE_LOOP			# se não, continua o loop

CHECK_Y_304:
		beq a2,t4,INVERT_TO_48		# verifica se y == 112, se sim, inverte para 48

CONTINUE_LOOP:
		mv a3,s0				# carrega o valor do frame em a3
		call PRINT				# imprime o sprite
		
		# Agora apagamos o rastro antigo
		la t0,OLD_CHAR_POS		# carrega em t0 o endereço de OLD_CHAR_POS
		lh a1,0(t0)				# carrega a posição x antiga do personagem em a1
		lh a2,2(t0)				# carrega a posição y antiga do personagem em a2
		call ERASE				# chama a função que apaga o "rastro" do char
		
		li t0,0xFF200604		# carrega em t0 o endereço de troca de frame
		sw s0,0(t0)				# mostra o sprite pronto para o usuário
		
		j GAME_LOOP				# continua o loop

INVERT_TO_304:
		li a1,304			# carrega o valor 304 em a1
		sh a1,0(t0)			# armazena 304 em t0
		li t3,16			# carrega o valor 16 em t3
		sub a1,a1,t3			# subtrai 16 de a1 (304 - 16)
		sh a1,0(t0)			# armazena o valor resultante em t0 (288)
		j CONTINUE_LOOP			# volta para CONTINUE_LOOP

INVERT_TO_48:
		li a1,48			# carrega o valor 48 em a1
		sh a1,0(t0)			# armazena 48 em t0
		li t3,16			# carrega o valor 16 em t3
		add a1,a1,t3			# adiciona 16 a a1 (48 + 16)
		sh a1,0(t0)			# armazena o valor resultante em t0 (64)
		j CONTINUE_LOOP			# volta para CONTINUE_LOOP

KEY2:	
        li t1, 0xFF200000        # carrega o endereco de controle do KDMMIO em t1
		lw t0, 0(t1)             # le o valor do bit de controle do teclado em t0
		andi t0, t0, 0x0001  	    # mascara o bit menos significativo em t0
   		beq t0, zero, MOVE_CHAR   # se t0 for zero, vai para MOVE_CHAR

  		lw t2, 4(t1)             # le o valor da tecla pressionada em t2.data
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

# Define constantes para as direções
LEFT:           .half 1         # valor da direção esquerda
RIGHT:          .half 2         # valor da direção direita
DOWN:           .half 3         # valor da direção baixo
UP:             .half 4         # valor da direção cima

# Dados do jogo
PONTOS:        .word 0            # pontos atuais do jogador
RECORDE:       .word 0            # recorde do jogador
VIDAS:         .word 3            # vidas que o jogador tem
VIDAS_POS:     .half 16, 208      # posição onde printar a quantidade de vidas
CURRENT_DIR:   .half 0            # direção atual (0 = parado, 1 = esquerda, 2 = direita, 3 = baixo, 4 = cima)
WANTED_DIR:    .half 0            # direção desejada

CHAR_POS:      .half 176, 208     # x, y
OLD_CHAR_POS:  .half 0, 0         # x, y

.text
SETUP:		la a0,labirinto1			# carrega o endereco do sprite 'labirinto1' em a0
		li a1,0				# x = 0
		li a2,0				# y = 0
		li a3,0				# frame = 0
		call PRINT			# imprime o sprite


		li t0, 'w'               # carrega o caractere 'w' em t0
		beq t2, t0, SET_WANTED_UP	# se t2 for igual a 'w', vai para SET_WANTED_UP

		li t0, 'a'               # carrega o caractere 'a' em t0
		beq t2, t0, SET_WANTED_LEFT	# se t2 for igual a 'a', vai para SET_WANTED_LEFT

		li t0, 's'               # carrega o caractere 's' em t0
		beq t2, t0, SET_WANTED_DOWN	# se t2 for igual a 's', vai para SET_WANTED_DOWN

		li t0, 'd'               # carrega o caractere 'd' em t0
		beq t2, t0, SET_WANTED_RIGHT	# se t2 for igual a 'd', vai para SET_WANTED_RIGHT
	
FIM:	
        ret                      # retorna da funcao

SET_WANTED_LEFT:	
        la t4, LEFT              # carrega o endereco de LEFT em t4
		la t5, WANTED_DIR		# carrega o endereco de WANTED_DIR em t5
		sh t4, 0(t5)			# armazena o endereco de LEFT em WANTED_DIR
		ret				# retorna da funcao

SET_WANTED_RIGHT:	
        la t4, RIGHT             # carrega o endereco de RIGHT em t4
		la t5, WANTED_DIR		# carrega o endereco de WANTED_DIR em t5
		sh t4, 0(t5)			# armazena o endereco de RIGHT em WANTED_DIR
		ret				# retorna da funcao

SET_WANTED_DOWN:	
        la t4, DOWN              # carrega o endereco de DOWN em t4
		la t5, WANTED_DIR		# carrega o endereco de WANTED_DIR em t5
		sh t4, 0(t5)			# armazena o endereco de DOWN em WANTED_DIR
		ret				# retorna da funcao

SET_WANTED_UP:	
        la t4, UP                # carrega o endereco de UP em t4
		la t5, WANTED_DIR		# carrega o endereco de WANTED_DIR em t5
		sh t4, 0(t5)			# armazena o endereco de UP em WANTED_DIR
		ret				# retorna da funcao
		

MOVE_CHAR:	
        la t0, CHAR_POS          # carrega o endereco de CHAR_POS em t0
		la t1, OLD_CHAR_POS      # carrega o endereco de OLD_CHAR_POS em t1
		lh t2, 0(t0)             # carrega o valor atual de x do personagem em t2
		lh t3, 2(t0)             # carrega o valor atual de y do personagem em t3

		sh t2, 0(t1)             # armazena o valor de x atual em OLD_CHAR_POS
		sh t3, 2(t1)             # armazena o valor de y atual em OLD_CHAR_POS

		la t4, WANTED_DIR		# carrega o endereco de WANTED_DIR em t4
		lh t4, 0(t4)             # carrega a direcao desejada em t4

		la t5, LEFT			# carrega o endereco de LEFT em t5
		beq t4, t5, TRY_LEFT		# se WANTED_DIR for LEFT, vai para TRY_LEFT
		la t5, RIGHT			# carrega o endereco de RIGHT em t5
		beq t4, t5, TRY_RIGHT		# se WANTED_DIR for RIGHT, vai para TRY_RIGHT
		la t5, DOWN			# carrega o endereco de DOWN em t5
		beq t4, t5, TRY_DOWN		# se WANTED_DIR for DOWN, vai para TRY_DOWN
		la t5, UP			# carrega o endereco de UP em t5
		beq t4, t5, TRY_UP		# se WANTED_DIR for UP, vai para TRY_UP
		j CONTINUE_MOVE			# se nao, vai para CONTINUE_MOVE

TRY_LEFT:	
        addi t2, t2, -16         # decrementa 16 de x (move para esquerda)
		j CHECK_COLLISION		# vai para CHECK_COLLISION

TRY_RIGHT:	
        addi t2, t2, 16          # incrementa 16 em x (move para direita)
		j CHECK_COLLISION		# vai para CHECK_COLLISION

TRY_DOWN:	
        addi t3, t3, 16          # incrementa 16 em y (move para baixo)
		j CHECK_COLLISION		# vai para CHECK_COLLISION

TRY_UP:	
        addi t3, t3, -16         # decrementa 16 de y (move para cima)
		j CHECK_COLLISION		# vai para CHECK_COLLISION

CHECK_COLLISION: 
		la t5, CURRENT_DIR		# carrega o endereco de CURRENT_DIR em t5
		sh t4, 0(t5)             # armazena a direcao desejada em CURRENT_DIR
		j CONTINUE_MOVE			# vai para CONTINUE_MOVE

CONTINUE_MOVE:	
        la t4, CURRENT_DIR		# carrega o endereco de CURRENT_DIR em t4
		lh t4, 0(t4)             # carrega a direcao atual em t4

		la t5, LEFT			# carrega o endereco de LEFT em t5
		beq t4, t5, MOVE_LEFT		# se CURRENT_DIR for LEFT, vai para MOVE_LEFT
		la t5, RIGHT			# carrega o endereco de RIGHT em t5
		beq t4, t5, MOVE_RIGHT		# se CURRENT_DIR for RIGHT, vai para MOVE_RIGHT
		la t5, DOWN			# carrega o endereco de DOWN em t5
		beq t4, t5, MOVE_DOWN		# se CURRENT_DIR for DOWN, vai para MOVE_DOWN
		la t5, UP			# carrega o endereco de UP em t5
		beq t4, t5, MOVE_UP		# se CURRENT_DIR for UP, vai para MOVE_UP
		ret				# retorna da funcao

MOVE_LEFT:	
        addi t2, t2, -16         # decrementa 16 de x (move para esquerda)
		j UPDATE_POSITION		# vai para UPDATE_POSITION

MOVE_RIGHT:	
        addi t2, t2, 16          # incrementa 16 em x (move para direita)
		j UPDATE_POSITION		# vai para UPDATE_POSITION

MOVE_DOWN:	
        addi t3, t3, 16          # incrementa 16 em y (move para baixo)
		j UPDATE_POSITION		# vai para UPDATE_POSITION

MOVE_UP:	
        addi t3, t3, -16         # decrementa 16 de y (move para cima)
		j UPDATE_POSITION		# vai para UPDATE_POSITION

UPDATE_POSITION:	
        	sh t2, 0(t0)             # atualiza a nova posicao x em CHAR_POS
		sh t3, 2(t0)             # atualiza a nova posicao y em CHAR_POS
		j CONTINUE_LOOP		# volta para CONTINUE_LOOP



#################################################
#	a0 = endereço imagem			#
#	a1 = x					#
#	a2 = y					#
#	a3 = frame (0 ou 1)			#
#################################################
#	t0 = endereço do bitmap display		#
#	t1 = endereço da imagem			#
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
		
		addi t1,a0,8			# t1 = a0 + 8
		
		mv t2,zero			# zera t2
		mv t3,zero			# zera t3
		
		lw t4,0(a0)			# carrega a largura em t4
		lw t5,4(a0)			# carrega a altura em t5
		
PRINT_LINHA:	lw t6,0(t1)			# carrega em t6 uma word (4 pixels) da imagem
		sw t6,0(t0)			# imprime no bitmap a word (4 pixels) da imagem
		
		addi t0,t0,4			# incrementa endereço do bitmap
		addi t1,t1,4			# incrementa endereço da imagem
		
		addi t3,t3,4			# incrementa contador de coluna
		blt t3,t4,PRINT_LINHA		# se contador da coluna < largura, continue imprimindo

		addi t0,t0,320			# t0 += 320
		sub t0,t0,t4			# t0 -= largura da imagem
		# isso serve pra "pular" de linha no bitmap display
		
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
		# t0 agora é nosso endereço do ponto na tela
		
		la t2, labirinto1		# carrega o endereco do labirinto1 em t2
		addi t2, t2, 8			# ajusta o ponteiro para a imagem
		# t0 é o nosso endereço, t2 é o ponteiro do fundo
		add t2, t2, t1			# ajusta o ponteiro do fundo

		li s1, 0			# contador de Y
		li s2, 0			# contador de X
		li s3, 16			# limite de pixels a serem apagados
		
		LOOP_Y:				# loop para linhas
		 li s2, 0                   # contador de X (colunas)
			LOOP_X:			# loop para colunas
				 lh t3, 0(t2)               # carrega a halfword de 4 pixels do fundo em t3
  				 sh t3, 0(t0)               # escreve os 4 pixels no bitmap na posição antiga
    				 addi t2, t2, 1             # incrementa o endereco da imagem (fundo)
    				 addi t0, t0, 1             # incrementa o endereco do bitmap (posição antiga)
    				 addi s2, s2, 1             # incrementa o contador de colunas
        			 blt s2, s3, LOOP_X         # se não alcançou o limite de pixels, repete o loop de colunas
				
			LOOP_X_END: 
			   addi t0, t0, 304           # move o endereço do bitmap para a próxima linha (320 bytes)
  			  addi t2, t2, 304           # move o ponteiro do fundo para a próxima linha
    			addi s1, s1, 1             # incrementa o contador de linhas
    			blt s1, s3, LOOP_Y         # repete o loop de linhas até o limite (16 pixels)
		LOOP_Y_END: 
		ret 				# retorna
