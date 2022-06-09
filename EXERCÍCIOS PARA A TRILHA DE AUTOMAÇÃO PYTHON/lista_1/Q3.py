# Q3) Construa um programa que recebe dois valores, soma esses valores e apresenta se o resultado é par ou impar.

valor_1 = float(input('Primeiro valor: '))
valor_2 = float(input('Segundo valor: '))

soma = valor_1 + valor_2
resto = soma % 2

if resto == 0:
    print('O resultado da soma é par!')
else:
    print('O resultado da soma é ímpar!')
