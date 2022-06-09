# Q2) Construa um programa que armazena em duas variaveis duas notas e apresenta a média entre as duas.
import numpy # O NumPy é uma biblioteca para a linguagem Python com funções para se trabalhar com computação numérica.

# função input() recebe como parâmetro uma string que será mostrada como auxílio ao usuário, geralmente o informando que tipo de dado o programa está aguardando receber,e nesse caso é um float(), uma variável que representa os números reais.
nota_1 = float(input('Primeira nota: '))
nota_2 = float(input('Segunda nota: '))

lista_notas = [nota_1, nota_2] # cria uma lista utilizando os dois valores de entrada.
media_notas = numpy.mean(lista_notas) # tira a média entre os valores presentes na lista. Nota-se que a função utilizada faz parte da biblioteca importada.

print('A média entre as notas é {}'.format(media_notas)) # imprime o valor resutante da média.

