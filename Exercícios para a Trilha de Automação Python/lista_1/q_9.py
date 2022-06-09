# Q9) Crie um programa que recebe 15 valores e armazena em uma lista, e no final da execução mostre os valores da lista do ultimo para o primeiro.
import numpy
lista = []
for v in range(1, 16):
    valores = int(input(f'Digite o {v}° valor: '))
    lista.append(valores)

lista.reverse()
print('O resultado invertido da lista é: {}'.format(lista))






