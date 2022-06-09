# Q5) Construa um programa que recebe 20 valores para X e no final apresenta a média aritmética dos valores pares digitados.
import numpy # O NumPy é uma biblioteca para a linguagem Python com funções para se trabalhar com computação numérica.

x = [[], []] # lista x, com duas listas internas.
for v in range(1, 21): # define uma faixa de valores para a função auxiliar v.
    valor = int(input(f'Digite o {v}° valor: '))
    if valor % 2 == 0: # resto igual a zero, representa um valor par e é adicionado a primeira lista presente em x.
        x[0].append(valor)
    else:
        x[1].append(valor) # caso contrario o valor é ímpar, e é adicionado a segunda lista presente em x.

media_aritmetica = numpy.mean(x[0]) # utilizando a função da biblioteca importada, têm-se a média aritmética dos valores presentes na primeira lita dentro da lista x.

print(f'A média aritmética dos valores pares digitados é: {media_aritmetica}') # imprime o resultado contido em media_aritmetica

# print(f'Os valores pares digitados foram: {sorted(x[0])}')
# print(f'Os valores ímpares digitados foram: {sorted(x[1])}')
