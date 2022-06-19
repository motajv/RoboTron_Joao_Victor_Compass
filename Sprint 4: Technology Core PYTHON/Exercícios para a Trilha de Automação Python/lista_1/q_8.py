# Q8) Crie um programa que lê 1 valor inteiro para X. Se o valor for par, calcular o fatorial de x em uma função e apresentar o resultado fora da função. Se o valor for impar, apresentar em uma função a tabuada de 1 a 10 de X.

def equacao():
    valor = int(input('Digite um numero inteiro: '))
    fatorial = 1
    result = 1
    cont = 1

    if (valor % 2) == 0:
        print("O valor é par!")
        while cont <= valor:
            fatorial = fatorial * cont
            cont = cont + 1
        print("Seu fatorial é: {} ".format(fatorial))
    else:
        print("O valor é ímpar e sua tabuada é: ")
        for i in range(1, 11):
            print(f'{i} x {valor} = {i*valor}')

equacao()


