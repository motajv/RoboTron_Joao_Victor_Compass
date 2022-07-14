# Q10) Crie um programa que recebe uma lista com três frutas e compare com uma lista com os valores ["maça", "banana", "pera"].

lista_1 = ["maçã", "banana", "pera"]
lista_2 = []
for v in range(1, 4):
    valores = str(input(f'Digite a {v}° fruta: '))
    valores_format = valores.lower()
    lista_2.append(valores_format)

if(set(lista_1) == set(lista_2)):
    print("As listas são iguais!")
else:
    print("As listas são diferentes!")

print("As seguintes frutas estão em ambas as listas: ", set(lista_1) & set(lista_2))



