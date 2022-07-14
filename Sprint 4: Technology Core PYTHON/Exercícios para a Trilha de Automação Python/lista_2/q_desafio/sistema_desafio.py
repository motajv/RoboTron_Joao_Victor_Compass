import pandas as pd
from lib.menu_desafio import *
from time import sleep

arquivo = pd.read_csv('tabela_p.csv', encoding='UTF-8', sep=",")

cabeçalho('TABELA PERIÓDICA v1.0')
while True:
    resposta = menu(['Mostrar apenas uma propriedade dos elementos.','Listar todos os dados de determinado elemento, buscando através do seu símbolo.','Listar todos os dados de todos os elementos inseridos.','Sair do sistema.'])
    if resposta == 1:
        propriedade_input = menu_opção(['Nome','Número Atômico','Linha','Coluna','Estado Físico'])
        if propriedade_input == 1:
            print(arquivo['Nome'])
        elif propriedade_input == 2:
            print(arquivo['Número_Atômico'])
        elif propriedade_input == 3:
            print(arquivo['Linha'])
        elif propriedade_input == 4:
            print(arquivo['Coluna'])
        elif propriedade_input == 5:
            print(arquivo['Estado_Físico'])
        #Símbolo, Nome, Número_Atômico, Linha, Coluna, Estado_Físico
        #print(arquivo[propriedade_input])
    elif resposta == 2:
        simbolo_input = str(input("Digite um símbulo de um elemento químico para ver suas propriedades: "))
        sb_input = simbolo_input.title()
        print(arquivo[arquivo["Símbolo"] == sb_input])
    elif resposta == 3:
        print(arquivo)
    elif resposta == 4:
        cabeçalho('Saindo do sistema... Até logo!')
        break
    else:
        print('ERRO! Digite uma opção válida!')
    sleep(4)
