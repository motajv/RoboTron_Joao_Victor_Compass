# Q6) Construa um programa que receba um valor inteiro maior que 2 em uma variavel x e apresenta os ímpares entre 0 e x.

x = int(input('Digite um valor inteiro maior que dois: '))

lista = [[],[]]

for v in range(0, x):
    if v % 2 == 0:
        lista[0].append(v)
    else:
        lista[1].append(v)

print('Os valores ímpares entre 0 e x são: {}'.format(lista[1]))
