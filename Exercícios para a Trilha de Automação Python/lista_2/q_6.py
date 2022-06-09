# Q6) Faça com que o programa printe apenas os primeiros dados dentro de edicao_atual, fase_atual, rodada_atual usando o JSON 2.
import json

def retornar_json():
    with open("JSON2.json", encoding="utf-8") as campeonato:
        json_manipulavel = json.load(campeonato)
        return json_manipulavel
json_retornado = retornar_json()
#print(json_retornado)
edicao_atual = json_retornado['edicao_atual']
fase_atual = json_retornado['fase_atual']
rodada_atual = json_retornado['rodada_atual']
print('-'*30)
print(json.dumps(edicao_atual, indent=2))
print('-'*30)
print(json.dumps(fase_atual, indent=2))
print('-'*30)
print(json.dumps(rodada_atual, indent=2))
print('-'*30)




