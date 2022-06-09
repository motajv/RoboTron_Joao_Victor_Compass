# Q5) Construa um programa que recebe 20 valores para X e no final apresenta a média aritmética dos valores pares digitados.
import numpy

x = [[], []]
for v in range(1, 21):
    valor = int(input(f'Digite o {v}° valor: '))
    if valor % 2 == 0:
        x[0].append(valor)
    else:
        x[1].append(valor)

media_aritmetica = numpy.mean(x[0])

print(f'A média aritmética dos valores pares digitados é: {media_aritmetica}')

# print(f'Os valores pares digitados foram: {sorted(x[0])}')
# print(f'Os valores ímpares digitados foram: {sorted(x[1])}')
