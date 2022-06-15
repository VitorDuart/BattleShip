programa
{
	inclua biblioteca Texto --> tx
	
	const inteiro NUM_LINHAS = 10
	const inteiro NUM_COLUNAS = 10
	const inteiro NUM_EMBARCACOES_ALOCADAS = 10
	const inteiro NUM_EMBARCACOES = 4
	const cadeia NOME_EMBARCACOES[NUM_EMBARCACOES] = {"PORTA-AVIOES", "NAVIOS-TANQUE", "CONTRATORPEDEIROS", "SUBMARINOS"}
	const inteiro TAMANHO_EMBARCACOES[NUM_EMBARCACOES] = {4, 3, 2, 1}
	
	funcao inicio()
	{
		
		inteiro tabuleiro_1[NUM_LINHAS][NUM_COLUNAS]
		inteiro tabuleiro_2[NUM_LINHAS][NUM_COLUNAS]
		inteiro integridade_embarcacoes_1[NUM_EMBARCACOES_ALOCADAS] = {4, 3, 3, 2, 2, 2, 1, 1, 1, 1}
		inteiro integridade_embarcacoes_2[NUM_EMBARCACOES_ALOCADAS] = {4, 3, 3, 2, 2, 2, 1, 1, 1, 1}
		inteiro classes_embarcacoes_alocadas_1[NUM_EMBARCACOES_ALOCADAS] = {0, 1, 1, 2, 2, 2, 3, 3, 3, 3}
		inteiro classes_embarcacoes_alocadas_2[NUM_EMBARCACOES_ALOCADAS] = {0, 1, 1, 2, 2, 2, 3, 3, 3, 3}


		inicializar_tabuleiro(tabuleiro_1)

		adicionar_embarcacoes_manualmente(tabuleiro_1)

		


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
		cadeia linhas[10] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J"}
		cadeia colunas[10] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}

		cadeia linha = tx.extrair_subtexto(entrada, 0, 1)
		cadeia coluna = tx.extrair_subtexto(entrada, 1, 2)

	
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

	
	funcao adicionar_embarcacoes_manualmente(inteiro tabuleiro[][])
	{	
		inteiro num_embarcacoes_classe[] = {1, 2, 3, 4}
		cadeia posicao_embarcacao
		inteiro escolha_embarcacao, i = NUM_EMBARCACOES_ALOCADAS
		inteiro coordenadas[2]
		inteiro escolha_orientacao
		
	
		enquanto(i != 0){
			escreva("ESCOLHA O TIPO DE EMBARCAÇÃO PARA ADICIONAR NA BATALHA:\n")
			escreva("0 - PORTA-AVIÕES\n") 
			escreva("1 - NAVIOS-TANQUE\n") 
			escreva("2 - CONTRATORPEDEIROS\n") 
			escreva("3 - SUBMARINOS\n")	

			leia(escolha_embarcacao)

			se(num_embarcacoes_classe[escolha_embarcacao] != 0){
				// num_embarcacoes_classe[escolha_de_embarcacao] = num_embarcacoes_classe[escolha_de_embarcacao] -1
				num_embarcacoes_classe[escolha_embarcacao] -= 1

				exibir_tabuleiro(tabuleiro)
				escreva("DIGITE A POSIÇÃO:\n")
				leia(posicao_embarcacao)
				extrair_coordenadas(coordenadas, posicao_embarcacao)

				
				escreva("ESCOLHA A ORIENTAÇÃO: \n")
				//Verifica a posição acima
				se (coordenadas[0] - (TAMANHO_EMBARCACOES[escolha_embarcacao]-1) >=0 ){
					escreva("0 - ACIMA \n")
				}

				//Verifica a posição abaixo
				se (coordenadas[0] + (TAMANHO_EMBARCACOES[escolha_embarcacao]-1) <= NUM_LINHAS-1 ){
					escreva("1 - ABAIXO \n")
				}

				//Verifica a posição esquerda
				se (coordenadas[1] - (TAMANHO_EMBARCACOES[escolha_embarcacao]-1) >=0 ){
					escreva("2 - ESQUERDA \n")
				}

				//Verifica a posição direita
				se (coordenadas[1] + (TAMANHO_EMBARCACOES[escolha_embarcacao]-1) <= NUM_COLUNAS-1 ){
					escreva("3 - DIREITA \n")
				}

				leia(escolha_orientacao)

				

				i--
			}senao{
				escreva("LIMITE DE ", NOME_EMBARCACOES[escolha_embarcacao], " ULTRAPASSADA!!!\n")
			}
		}
		
		//leia(escolha_de_embarcacao)

		//escreva("ESCOLHA A POSIÇÃO DA EMBARCAÇÃO UTILIZANDO LETRAS MAIÚSCULAS:\n")
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
							se(tabuleiro[i-1][j-1] == 3){
								escreva("s\t")
							}senao{
								escreva("pa\t")
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
 * @POSICAO-CURSOR = 2805; 
 * @DOBRAMENTO-CODIGO = [32, 42, 70];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */