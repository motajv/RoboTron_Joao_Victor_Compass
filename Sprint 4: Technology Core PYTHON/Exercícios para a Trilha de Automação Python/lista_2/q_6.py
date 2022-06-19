# Q6) Faça com que o programa printe apenas os primeiros dados dentro de edicao_atual, fase_atual, rodada_atual usando o JSON 2.
import json

def retornar_json():
    with open("JSON2.json", encoding="utf-8") as campeonato:
        json_manipulavel = json.load(campeonato)
        return json_manipulavel
json_retornado = retornar_json()

lista = ["edicao_atual", "fase_atual", "rodada_atual"]

dados = 2

for objeto in lista:
    print(f'\nAs {dados} primeiras chave e valor de {objeto} são:')
    for n in range(dados):
        chave = list(json_retornado[objeto])[n]
        valor = json_retornado[objeto][chave]
        print(f'{chave} : {valor}')




