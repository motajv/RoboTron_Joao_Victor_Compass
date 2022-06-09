# Q6) Faça com que o programa printe apenas os primeiros dados dentro de edicao_atual, fase_atual, rodada_atual usando o JSON 2.
import json

def retornar_json():
    with open("JSON2.json", encoding="utf-8") as campeonato:
        json_manipulavel = json.load(campeonato)
        return json_manipulavel
json_retornado = retornar_json()
#print(json_retornado)
print(type(json_retornado['campeonato_id']))
print(json_retornado)