# Q4) No JSON 1 printe todas as chaves e valores do time visitante.
import json

def retornar_json():
    with open("JSON1.json", encoding="utf-8") as partida:
        json_manipulavel = json.load(partida)
        return json_manipulavel
json_retornado = retornar_json()

print(json_retornado['copa-do-brasil'][0]['time_visitante'])