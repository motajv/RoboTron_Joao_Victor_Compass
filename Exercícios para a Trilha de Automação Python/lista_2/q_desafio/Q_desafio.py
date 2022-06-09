import pandas as pd

arquivo = pd.read_csv('tabela_p.csv', encoding='UTF-8', sep=",")
nome_input = str(input("Propriedades:\nNome\nNúmero_Atômico\nLinha\nColuna\nEstado_Físico\nDigite uma das propriedades acima: "))
print(arquivo[nome_input])

simbolo_input = str(input("Digite um símbulo de um elemento químico para ver suas propriedades: "))
print(arquivo[arquivo["Símbolo"] == simbolo_input])

print(arquivo)
Nome,Número_Atômico,Linha,Coluna,Estado_Físico