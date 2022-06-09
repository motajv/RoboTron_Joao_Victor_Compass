# Q4) Construa um programa que armazena uma idade em uma váriavel e compara, se a idade for maior que 18, apresenta "Maior de idade", se a idade for menor que 12, apresenta "Você é uma criança" e se for maior que 12 e menor que 18, apresenta "Você é um adolescente.

idade = int(input('Digite sua idade: ')) # input() para entrada de valores, int() informando que o valor deve ser inteiro, pois não usual idade com valor decimal.

# condicionais, se a idade informada for maior ou igual a 18, imprime-se "Maior de idade!", se for menor que 12, imprime-se "Você é uma criança!" e caso não seja nenhuma das alternativas, imprime-se "Você é um adolescente!".
if idade >= 18:
    print('Maior de idade!')
elif idade < 12:
    print('Você é uma criança!')
else:
    print('Você é um adolescente!')

