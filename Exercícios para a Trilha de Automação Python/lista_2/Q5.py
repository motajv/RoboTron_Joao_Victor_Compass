# Q5) Guarde o arquivo JSON 2 nomeando-o como campeonato em uma variável e printe todos os seus dados.
import json

def retornar_json():
    with open("JSON2.json", encoding="utf-8") as campeonato:
        json_manipulavel = json.load(campeonato)
        return json_manipulavel
json_retornado = retornar_json()

print(json_retornado)