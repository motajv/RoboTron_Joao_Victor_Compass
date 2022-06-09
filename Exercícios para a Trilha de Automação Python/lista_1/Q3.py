# Q3) Construa um programa que recebe dois valores, soma esses valores e apresenta se o resultado é par ou impar.

# função input() recebe como parâmetro uma string que será mostrada como auxílio ao usuário, geralmente o informando que tipo de dado o programa está aguardando receber,e nesse caso é um float(), uma variável que representa os números reais.
valor_1 = float(input('Primeiro valor: '))
valor_2 = float(input('Segundo valor: '))

soma = valor_1 + valor_2 # como nossas entradas declaradas são valores numéricos, podemos efetuar a soma utilizando o operador + diretamente.
resto = soma % 2 # em Python, o operador resto é o sinal de porcentagem ( % ), dessa forma define-se o resto utilizando a seguinte função.

# condicionais, se o resto for igual a 0, então deve-se imprimir a resposta infomando que o valor é par, caso contrário o valor é ímpar.
if resto == 0:
    print('O resultado da soma é par!')
else:
    print('O resultado da soma é ímpar!')
