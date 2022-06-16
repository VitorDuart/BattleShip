programa
{
	inclua biblioteca Texto --> tx
	
	const inteiro NUM_LINHAS = 10
	const inteiro NUM_COLUNAS = 10
	const inteiro NUM_EMBARCACOES_ALOCADAS = 10
	const inteiro NUM_EMBARCACOES = 4
	const cadeia NOME_EMBARCACOES[NUM_EMBARCACOES] = {"PORTA-AVIOES", "NAVIOS-TANQUE", "CONTRATORPEDEIROS", "SUBMARINOS"}
	const inteiro TAMANHO_EMBARCACOES[NUM_EMBARCACOES] = {4, 3, 2, 1}
	const cadeia NOME_DIRECOES[4] = {"ACIMA", "ABAIXO", "ESQUERDA", "DIREITA"}
	/*Codificaçãoes:
	-3 = quadrado descoberto com embarcação
	-2 = quadrado descoberto sem embarcação
	-1 - Mar
	0 - Embarcação de 4 blocos
	1 - Embarcação de 3 Blocos
	2 - Embarcação de 3 blocos
	3 - Embarcações de 2 Blocos
	4 - Embarcações de 2 Blocos
	5 - Embarcações de 2 Blocos
	6 - Embarcação de 1 bloco
	7 - Embarcação de 1 bloco
	8 - Embarcação de 1 bloco
	9 - Embarcação de 1 bloco*/

	inteiro codigos_embarcacoes[10] = {0, 1, 1, 2, 2, 2, 3, 3, 3, 3}
	
	funcao inicio()
	{
		
		inteiro tabuleiro_1[NUM_LINHAS][NUM_COLUNAS]
		inteiro tabuleiro_2[NUM_LINHAS][NUM_COLUNAS]
		inteiro integridade_embarcacoes_1[NUM_EMBARCACOES_ALOCADAS] = {4, 3, 3, 2, 2, 2, 1, 1, 1, 1}
		inteiro integridade_embarcacoes_2[NUM_EMBARCACOES_ALOCADAS] = {4, 3, 3, 2, 2, 2, 1, 1, 1, 1}
		inteiro classes_embarcacoes_alocadas_1[NUM_EMBARCACOES_ALOCADAS] = {0, 1, 1, 2, 2, 2, 3, 3, 3, 3}
		inteiro classes_embarcacoes_alocadas_2[NUM_EMBARCACOES_ALOCADAS] = {0, 1, 1, 2, 2, 2, 3, 3, 3, 3}


		inicializar_tabuleiro(tabuleiro_1)
		inicializar_tabuleiro(tabuleiro_2)

		escreva("TABULEIRO JOGADOR 1\n")
		adicionar_embarcacoes_manualmente(tabuleiro_1)
		escreva("TABULEIRO JOGADOR 2\n")
		adicionar_embarcacoes_manualmente(tabuleiro_2)
		
	
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
		cadeia coluna
		
		se(tx.numero_caracteres(entrada) == 2){
			 coluna = tx.extrair_subtexto(entrada, 1, 2)
		}senao{
			coluna = tx.extrair_subtexto(entrada, 1, 3)
		}
		
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

	funcao adicionar_embarcacoes_aleatorio(inteiro tabuleiro[][]){
		
	}

	funcao verificar_orientacao(inteiro coordenadas[], inteiro tamanho_embarcacao, inteiro direcoes[]){
		//Verifica a posição acima
		se (coordenadas[0] - (tamanho_embarcacao-1) >=0 ){
			direcoes[0] = 1
		}

		//Verifica a posições abaixo
		se (coordenadas[0] + (tamanho_embarcacao-1) <= NUM_LINHAS-1 ){
			direcoes[1] = 1
		}

		//Verifica a posição esquerda
		se (coordenadas[1] - (tamanho_embarcacao-1) >=0 ){
			direcoes[2] = 1
		}

		//Verifica a posiﾃｧﾃ｣o direita
		se (coordenadas[1] + (tamanho_embarcacao-1) <= NUM_COLUNAS-1 ){
			direcoes[3] = 1
		}

	}
	
	/*funcao construir_embarcacao(){
		
	}*/
	
	funcao adicionar_embarcacoes_manualmente(inteiro tabuleiro[][])
	{	
		inteiro num_embarcacoes_classe[] = {1, 2, 3, 4}
		cadeia posicao_embarcacao
		inteiro escolha_embarcacao, i = NUM_EMBARCACOES_ALOCADAS
		inteiro coordenadas[2]
		inteiro escolha_orientacao
		
		inteiro contador_codigos_embarcacoes[] = {0, 1, 3, 6}
	
		enquanto(i != 0){
			escreva("ESCOLHA O TIPO DE EMBARCAÇÕES PARA ADICIONAR NA BATALHA:\n")
			escreva("0 - PORTA-AVIÕES(4 quadrados)\n") 
			escreva("1 - NAVIOS-TANQUE(3 quadrados)\n") 
			escreva("2 - CONTRATORPEDEIROS(2 quadrados)\n") 
			escreva("3 - SUBMARINOS(1 quadrados)\n")	

			leia(escolha_embarcacao)

			se(num_embarcacoes_classe[escolha_embarcacao] != 0){
				inteiro direcoes[4]
				// num_embarcacoes_classe[escolha_de_embarcacao] = num_embarcacoes_classe[escolha_de_embarcacao] -1
				num_embarcacoes_classe[escolha_embarcacao] -= 1
				

				exibir_tabuleiro(tabuleiro)
				escreva("DIGITE A POSIÇÃO:\n")
				leia(posicao_embarcacao)
				extrair_coordenadas(coordenadas, posicao_embarcacao)
				
				escreva("ESCOLHA A ORIENTAÇÃO: \n")
				
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
		
		//leia(escolha_de_embarcacao)

		//escreva("ESCOLHA A POSIﾃ�ﾃグ DA EMBARCAﾃ�ﾃグ UTILIZANDO LETRAS MAIﾃ售CULAS:\n")
		//leia(posicao_da_embarcacao)

		
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
	}


	funcao exibir_instrucoes(){
			
	}

	
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1669; 
 * @DOBRAMENTO-CODIGO = [51, 61, 95, 99, 232];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */