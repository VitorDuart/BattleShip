/*Codificaﾃｧﾃ｣oes:
	-3 = quadrado descoberto com embarcaﾃｧﾃ｣o - Acertou
	-2 = quadrado descoberto sem embarcaﾃｧﾃ｣o - Errou
	-1 - Mar
	0 - Embarcaﾃｧﾃ｣o de 4 blocos
	1 - Embarcaﾃｧﾃ｣o de 3 Blocos
	2 - Embarcaﾃｧﾃ｣o de 3 blocos
	3 - Embarcaﾃｧﾃｵes de 2 Blocos
	4 - Embarcaﾃｧﾃｵes de 2 Blocos
	5 - Embarcaﾃｧﾃｵes de 2 Blocos
	6 - Embarcaﾃｧﾃ｣o de 1 bloco
	7 - Embarcaﾃｧﾃ｣o de 1 bloco
	8 - Embarcaﾃｧﾃ｣o de 1 bloco
	9 - Embarcaﾃｧﾃ｣o de 1 bloco*/
programa
{
	inclua biblioteca Texto --> tx
	inclua biblioteca Util --> u
	
	const inteiro NUM_LINHAS = 10
	const inteiro NUM_COLUNAS = 10
	const inteiro NUM_EMBARCACOES_ALOCADAS = 10
	const inteiro NUM_EMBARCACOES = 4
	const cadeia NOME_EMBARCACOES[NUM_EMBARCACOES] = {"PORTA-AVIOES", "NAVIOS-TANQUE", "CONTRATORPEDEIROS", "SUBMARINOS"}
	const inteiro TAMANHO_EMBARCACOES[NUM_EMBARCACOES] = {4, 3, 2, 1}
	const cadeia NOME_DIRECOES[4] = {"ACIMA", "ABAIXO", "ESQUERDA", "DIREITA"}
	const inteiro CODIGO_EMBARCACOES[10] = {0, 1, 1, 2, 2, 2, 3, 3, 3, 3}
	
	funcao inicio()
	{
		
		inteiro tabuleiro_1[NUM_LINHAS][NUM_COLUNAS]
		inteiro tabuleiro_2[NUM_LINHAS][NUM_COLUNAS]
		inteiro integridade_embarcacoes_1[NUM_EMBARCACOES_ALOCADAS] = {4, 3, 3, 2, 2, 2, 1, 1, 1, 1}
		inteiro integridade_embarcacoes_2[NUM_EMBARCACOES_ALOCADAS] = {4, 3, 3, 2, 2, 2, 1, 1, 1, 1}
		
		
		inicializar_tabuleiro(tabuleiro_1)
		inicializar_tabuleiro(tabuleiro_2)

		escreva("TABULEIRO JOGADOR 1\n")
		adicionar_embarcacoes_aleatorio(tabuleiro_1)
		escreva("TABULEIRO JOGADOR 2\n")
		adicionar_embarcacoes_aleatorio(tabuleiro_2)

		

		// assume o valor 1 ou 2
		// valor 1 vez do jogador 1
		// valor 2 vez do jogador 2
		escreva("INICIANDO PARTIDA\n")
		inteiro vez = 1
		inteiro tabuleiro_vazio1 = tabuleiro_vazio(integridade_embarcacoes_1)
		inteiro tabuleiro_vazio2 = tabuleiro_vazio(integridade_embarcacoes_2)
		enquanto(nao(tabuleiro_vazio1== 1 ou tabuleiro_vazio2== 1)){
			se(vez == 1){
				escreva("VEZ DO JOGADOR 1 \n")
				exibir_tabuleiro_jogo(tabuleiro_2)
				
				cadeia posicao
				
				inteiro coordenadas[2]
				
				inteiro resposta
				
				faca{
					escreva("INSIRA A POSICAO DO TIRO\n")
					
					leia(posicao)
					extrair_coordenadas(coordenadas, posicao)
					
					resposta = atirar(tabuleiro_2, coordenadas, integridade_embarcacoes_2)
			

					exibir_tabuleiro_jogo(tabuleiro_2)
						
					se(resposta > -1){
						se(integridade_embarcacoes_2[resposta] == 0){
							inteiro codigo = CODIGO_EMBARCACOES[resposta]
							escreva("O ", NOME_EMBARCACOES[codigo], " FOI DERRUBADA", "\n")
						}
					}
					
				}enquanto(resposta > -1)
					
				vez = 2
			}senao{
				escreva("VEZ DO JOGADOR 2 \n")
				exibir_tabuleiro_jogo(tabuleiro_1)

				cadeia posicao
				
				inteiro coordenadas[2]
				
				inteiro resposta
				
				faca{
					escreva("INSIRA A POSICAO DO TIRO\n")
					
					leia(posicao)
					extrair_coordenadas(coordenadas, posicao)
					
					resposta = atirar(tabuleiro_1, coordenadas, integridade_embarcacoes_1)
					exibir_tabuleiro_jogo(tabuleiro_1)

					se(resposta > -1){
						se(integridade_embarcacoes_1[resposta] == 0){
							inteiro codigo = CODIGO_EMBARCACOES[resposta]
							escreva("O ", NOME_EMBARCACOES[codigo], " FOI DERRUBADA", "\n")
						}
					}
					
				}enquanto(resposta > -1)
				
				vez =1
			}
			tabuleiro_vazio1 = tabuleiro_vazio(integridade_embarcacoes_1)
			tabuleiro_vazio2 = tabuleiro_vazio(integridade_embarcacoes_2)
			
		}

		se(tabuleiro_vazio1 == 1){
			escreva("JOGADOR 2 GANHOU!!!!")
		}senao{
			escreva("JOGADOR 1 GANHOU!!!!")
		}
	
	}
		
	
	funcao inicializar_tabuleiro(inteiro tabuleiro[][])
	{
		para(inteiro i = 0; i < NUM_LINHAS; i++){
			para(inteiro j = 0; j < NUM_COLUNAS; j++){
				tabuleiro[i][j] = -1
			}
		}
		
	}

	funcao extrair_coordenadas(inteiro coordenadas[], cadeia entrada){
		cadeia linhas[NUM_LINHAS] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J"}
		cadeia colunas[NUM_COLUNAS] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}

		
		cadeia linha = tx.extrair_subtexto(entrada, 0, 1)
		cadeia coluna = tx.extrair_subtexto(entrada, 1, tx.numero_caracteres(entrada))
		
		//extrair linha
		inteiro pos_linha = 0
		para(inteiro i = 0; i < 10; i++){
			se(linhas[i] == linha){
				pos_linha = i
			}
		}

		//extrair coluna
		inteiro pos_coluna = 0
		para(inteiro i = 0; i < 10; i++){
			se(colunas[i] == coluna){
				pos_coluna = i
			}			
		}

		coordenadas[0] = pos_linha
		coordenadas[1] = pos_coluna
	}

	funcao verificar_orientacao(inteiro coordenadas[], inteiro tamanho_embarcacao, inteiro direcoes[]){
		//Verifica a posiﾃｧﾃ｣o acima
		se (coordenadas[0] - (tamanho_embarcacao-1) >=0 ){
			direcoes[0] = 1
		}

		//Verifica a posiﾃｧﾃｵes abaixo
		se (coordenadas[0] + (tamanho_embarcacao-1) <= NUM_LINHAS-1 ){
			direcoes[1] = 1
		}

		//Verifica a posiﾃｧﾃ｣o esquerda
		se (coordenadas[1] - (tamanho_embarcacao-1) >=0 ){
			direcoes[2] = 1
		}

		//Verifica a posi�ｾ�ｽｧ�ｾ�ｽ｣o direita
		se (coordenadas[1] + (tamanho_embarcacao-1) <= NUM_COLUNAS-1 ){
			direcoes[3] = 1
		}

	}
	
	funcao verificar_orientacao_aleatorio(
		inteiro tabuleiro[][], inteiro coordenadas[],  
		inteiro tamanho_embarcacao, inteiro direcoes[]	
	){
		inteiro disponivel
		inteiro x,y,i
		
		//Verifica a posição acima
		se (coordenadas[0] - (tamanho_embarcacao-1) >=0 ){
			x = coordenadas[0]
			y = coordenadas[1]

			i = 0
			enquanto(i < tamanho_embarcacao e tabuleiro[x][y] == -1){
				i += 1
				x -= 1
				
			}

			se(i > tamanho_embarcacao){
				direcoes[0] = 1
			}
		}

		//Verifica a posições abaixo
		se (coordenadas[0] - (tamanho_embarcacao-1) >=0 ){
			x = coordenadas[0]
			y = coordenadas[1]

			i = 0
			enquanto(i < tamanho_embarcacao e tabuleiro[x][y] == -1){
				i += 1
				x += 1
			}

			se(i > tamanho_embarcacao){
				direcoes[1] = 1
			}
		}

		//Verifica a posição esquerda
		se (coordenadas[0] - (tamanho_embarcacao-1) >=0 ){
			x = coordenadas[0]
			y = coordenadas[1]

			i = 0
			enquanto(i < tamanho_embarcacao e tabuleiro[x][y] == -1){
				i += 1
				y -= 1
			}

			se(i > tamanho_embarcacao){
				direcoes[2] = 1
			}
		}

		//Verifica a posição direita
		se (coordenadas[0] - (tamanho_embarcacao-1) >=0 ){
			x = coordenadas[0]
			y = coordenadas[1]

			i = 0
			enquanto(i <= tamanho_embarcacao-1 e tabuleiro[x][y] == -1){
				i += 1
				y += 1
			}

			se(i > tamanho_embarcacao){
				direcoes[3] = 1
			}
		}
	}
	
	funcao adicionar_embarcacoes_aleatorio(inteiro tabuleiro[][]){
		inteiro coordenadas[2]
		inteiro contador_codigos_embarcacoes[] = {0, 1, 3, 6}
		inteiro i=0

		enquanto(i<NUM_EMBARCACOES_ALOCADAS){
			inteiro embarcacao = CODIGO_EMBARCACOES[i]
			inteiro direcoes[4]
			
			coordenadas[0] = u.sorteia(0, NUM_LINHAS-1)
			coordenadas[1] = u.sorteia(0, NUM_COLUNAS-1)

			
			verificar_orientacao_aleatorio(tabuleiro, coordenadas, TAMANHO_EMBARCACOES[embarcacao], direcoes)


			inteiro disponivel=0
			para(inteiro j=0; j<4; j++){
				disponivel += direcoes[j]
			}

			se(disponivel>0){
				inteiro orientacao
				faca{
					orientacao = u.sorteia(0, 3)
				}enquanto(direcoes[orientacao]!=1)
	
	
				se (orientacao == 0){
					para(inteiro j=0; j < TAMANHO_EMBARCACOES[embarcacao]; j++){
						tabuleiro[coordenadas[0]][coordenadas[1]] = contador_codigos_embarcacoes[embarcacao]
						coordenadas[0] -=1
					}
					
					se(embarcacao != 0) {
						contador_codigos_embarcacoes[embarcacao] +=1
					}
				}
				se (orientacao == 1){
					para(inteiro j=0; j < TAMANHO_EMBARCACOES[embarcacao]; j++){
						tabuleiro[coordenadas[0]][coordenadas[1]] = contador_codigos_embarcacoes[embarcacao]
						coordenadas[0] +=1
					}
					
					se(embarcacao != 0) {
						contador_codigos_embarcacoes[embarcacao] +=1
					}
					
				}
				se (orientacao == 2){
					para(inteiro j=0; j < TAMANHO_EMBARCACOES[embarcacao]; j++){
						tabuleiro[coordenadas[0]][coordenadas[1]] = contador_codigos_embarcacoes[embarcacao]
						coordenadas[1] -=1
					}
					
					se(embarcacao != 0) {
						contador_codigos_embarcacoes[embarcacao] +=1
					}
				}
				se (orientacao == 3){
					para(inteiro j=0; j < TAMANHO_EMBARCACOES[embarcacao]; j++){
						tabuleiro[coordenadas[0]][coordenadas[1]] = contador_codigos_embarcacoes[embarcacao]
						coordenadas[1] +=1
					}
					
					se(embarcacao != 0) {
						contador_codigos_embarcacoes[embarcacao] +=1
					}
				}
				i++
			}
			
		}	
		exibir_tabuleiro(tabuleiro)
		
	}
	
	funcao adicionar_embarcacoes_manualmente(inteiro tabuleiro[][])
	{	
		inteiro num_embarcacoes_classe[] = {1, 2, 3, 4}
		cadeia posicao_embarcacao
		inteiro escolha_embarcacao, i = NUM_EMBARCACOES_ALOCADAS
		inteiro coordenadas[2]
		inteiro escolha_orientacao
		inteiro contador_codigos_embarcacoes[] = {0, 1, 3, 6}
	
		enquanto(i != 0){
			
			escreva("ESCOLHA O TIPO DE EMBARCAﾃ�ﾃ髭S PARA ADICIONAR NA BATALHA:\n")
			escreva("0 - PORTA-AVIﾃ髭S(4 quadrados)\n") 
			escreva("1 - NAVIOS-TANQUE(3 quadrados)\n") 
			escreva("2 - CONTRATORPEDEIROS(2 quadrados)\n") 
			escreva("3 - SUBMARINOS(1 quadrado)\n")	

			leia(escolha_embarcacao)

			se(num_embarcacoes_classe[escolha_embarcacao] != 0){
				inteiro direcoes[4]
				// num_embarcacoes_classe[escolha_de_embarcacao] = num_embarcacoes_classe[escolha_de_embarcacao] -1
				num_embarcacoes_classe[escolha_embarcacao] -= 1
				

				
				escreva("DIGITE A POSIﾃ�ﾃグ:\n")
				leia(posicao_embarcacao)
				extrair_coordenadas(coordenadas, posicao_embarcacao)
				
				escreva("ESCOLHA A ORIENTAﾃ�ﾃグ: \n")
				
				verificar_orientacao(coordenadas, TAMANHO_EMBARCACOES[escolha_embarcacao], direcoes)
				

				para(inteiro j=0; j < 4; j++){
					se(direcoes[j] == 1){
						escreva(j," - ", NOME_DIRECOES[j], "\n")
					}	
				}
				leia(escolha_orientacao)

				se (escolha_orientacao == 0){
					para(inteiro j=0; j < TAMANHO_EMBARCACOES[escolha_embarcacao]; j++){
						tabuleiro[coordenadas[0]][coordenadas[1]] = contador_codigos_embarcacoes[escolha_embarcacao]
						coordenadas[0] -=1
					}
					
					se(escolha_embarcacao != 0) {
						contador_codigos_embarcacoes[escolha_embarcacao] +=1
					}
					
					exibir_tabuleiro(tabuleiro)
				}
				se (escolha_orientacao == 1){
					para(inteiro j=0; j < TAMANHO_EMBARCACOES[escolha_embarcacao]; j++){
						tabuleiro[coordenadas[0]][coordenadas[1]] = contador_codigos_embarcacoes[escolha_embarcacao]
						coordenadas[0] +=1
					}
					
					se(escolha_embarcacao != 0) {
						contador_codigos_embarcacoes[escolha_embarcacao] +=1
					}
					
					exibir_tabuleiro(tabuleiro)
				}
				se (escolha_orientacao == 2){
					para(inteiro j=0; j < TAMANHO_EMBARCACOES[escolha_embarcacao]; j++){
						tabuleiro[coordenadas[0]][coordenadas[1]] = contador_codigos_embarcacoes[escolha_embarcacao]
						coordenadas[1] -=1
					}
					
					se(escolha_embarcacao != 0) {
						contador_codigos_embarcacoes[escolha_embarcacao] +=1
					}
					
					exibir_tabuleiro(tabuleiro)
				}
				se (escolha_orientacao == 3){
					para(inteiro j=0; j < TAMANHO_EMBARCACOES[escolha_embarcacao]; j++){
						tabuleiro[coordenadas[0]][coordenadas[1]] = contador_codigos_embarcacoes[escolha_embarcacao]
						coordenadas[1] +=1
					}
					
					se(escolha_embarcacao != 0) {
						contador_codigos_embarcacoes[escolha_embarcacao] +=1
					}
					
					exibir_tabuleiro(tabuleiro)
					 
				}
	
				i--
			}senao{
				escreva("LIMITE DE ", NOME_EMBARCACOES[escolha_embarcacao], " ULTRAPASSADA!!!\n")
			}
		}
		
	}

	funcao inteiro tabuleiro_vazio(inteiro integridade_embarcacoes[]){
		inteiro soma = 0
		para(inteiro i=0; i< NUM_EMBARCACOES_ALOCADAS; i++){
			soma += integridade_embarcacoes[i]
		}

		se(soma == 0)
			retorne 1
		
		retorne 0
	}

	funcao inteiro atirar(inteiro tabuleiro[][], inteiro coordenadas[], inteiro integridade_embarcacoes[]){
		inteiro codigo_coordenada = tabuleiro[coordenadas[0]][coordenadas[1]]

		se(codigo_coordenada > -1){
			tabuleiro[coordenadas[0]][coordenadas[1]] = -3
			integridade_embarcacoes[codigo_coordenada] -= 1
		}senao{
			se(codigo_coordenada == -1){
				tabuleiro[coordenadas[0]][coordenadas[1]] = -2
			}
		}
		
		
		retorne codigo_coordenada
	}

	funcao exibir_tabuleiro_jogo(inteiro tabuleiro[][]){
		cadeia letras[10] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J"}

		para(inteiro i = 0; i < NUM_LINHAS + 1; i++){
			para(inteiro j = 0; j < NUM_COLUNAS + 1; j++){
				se(i == 0){
					se(j == 0){
						escreva(" \t")
					}senao{
						escreva(j + "\t")
					}
				}senao{
					se(j == 0){
						escreva(letras[i-1] + "\t")
					}senao{
						se(tabuleiro[i-1][j-1] >= -1 ){
							escreva("-\t")
						}senao{
							se(tabuleiro[i-1][j-1] == -2 ){
								escreva("X\t")
							}se(tabuleiro[i-1][j-1] == -3){
								escreva("O\t")
							}
							
						}
					}
				}
			}
			se(i == 0){
				escreva("\n")
			}

			escreva("\n")
		}
		escreva("\n")
	}
	
	funcao exibir_tabuleiro(inteiro tabuleiro[][]){
		cadeia letras[10] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J"}
		
		para(inteiro i = 0; i < NUM_LINHAS + 1; i++){
			para(inteiro j = 0; j < NUM_COLUNAS + 1; j++){
				se(i == 0){
					se(j == 0){
						escreva(" \t")
					}senao{
						escreva(j + "\t")
					}
				}senao{
					se(j == 0){
						escreva(letras[i-1] + "\t")
					}senao{
						se(tabuleiro[i-1][j-1] == -1){
							escreva("-\t")
						}senao{
							se(tabuleiro[i-1][j-1] == 0){
								escreva("pa\t")
							}se(
								tabuleiro[i-1][j-1] == 1 ou tabuleiro[i-1][j-1] == 2 
							){
								escreva("nt\t")
							}se(
								tabuleiro[i-1][j-1] == 3 ou  tabuleiro[i-1][j-1] == 4 ou 
								tabuleiro[i-1][j-1] == 5
							){
								escreva("ct\t")
							}se(
								tabuleiro[i-1][j-1] == 6 ou tabuleiro[i-1][j-1] == 7 ou
								tabuleiro[i-1][j-1] == 8 ou tabuleiro[i-1][j-1] == 9
							){
								escreva("s\t")
							}
							
						}
					}
				}
				

			}

			se(i == 0){
				escreva("\n")
			}

			escreva("\n")
		}
		escreva("\n")
	}


	funcao exibir_instrucoes(){
			
	}

	
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5423; 
 * @DOBRAMENTO-CODIGO = [460];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */