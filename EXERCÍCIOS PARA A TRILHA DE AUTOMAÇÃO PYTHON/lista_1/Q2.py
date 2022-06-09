# Q2) Construa um programa que armazena em duas variaveis duas notas e apresenta a média entre as duas.
import numpy

nota_1 = float(input('Primeira nota: '))
nota_2 = float(input('Segunda nota: '))

lista_notas = [nota_1, nota_2]
media_notas = numpy.mean(lista_notas)

print('A média entre as notas é {}'.format(media_notas))

