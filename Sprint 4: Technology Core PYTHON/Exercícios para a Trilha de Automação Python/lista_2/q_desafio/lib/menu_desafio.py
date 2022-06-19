def leiaInt(msg):
    while True:
        try:
            n = int(input(msg))
        except (ValueError, TypeError):
            print('\033[31mERRO: por favor,digite um número inteiro válido.\033[m')
            continue
        except (ValueError, TypeError):
            print('\033[31mUsuário preferiu não digitar esse número.\033[m')
            return 0
        else:
            return n

def linha(tam = 81):
    return '-' * tam


def cabeçalho(txt):
    print(linha())
    print(txt.center(81))
    print(linha())

def menu(lista):
    cabeçalho('MENU PRINCIPAL')
    c = 1
    for item in lista:
        print(f'{c}-{item}')
        c += 1
    print(linha())
    opc = leiaInt('Sua opção: ')
    return opc

def menu_opção(lista):
    cabeçalho('SELECIONE A PROPRIEDADE DOS ELEMENTOS')
    c = 1
    for item in lista:
        print(f'{c}-{item}')
        c += 1
    print(linha())
    opc = leiaInt('Sua opção: ')
    return opc