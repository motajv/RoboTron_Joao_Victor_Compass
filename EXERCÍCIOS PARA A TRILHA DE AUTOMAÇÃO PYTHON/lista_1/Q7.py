# Q7) Crie um programa que contêm uma função que receba dois parâmetros inteiros e retorna a média dos dois valores.
import numpy

valor_1 = int(input('Primeiro valor: '))
valor_2 = int(input('Segundo valor: '))
lista = [valor_1, valor_2]
media = numpy.mean(lista)

print('A média entre os dois valores é {}'.format(media))