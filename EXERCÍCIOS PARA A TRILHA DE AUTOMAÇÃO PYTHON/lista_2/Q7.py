# Q7) Percorra o JSON 2, utilizando o loop FOR e printe suas chaves principais.
import json

def retornar_json():
    with open("JSON2.json", encoding="utf-8") as campeonato:
        json_manipulavel = json.load(campeonato)
        return json_manipulavel
json_retornado = retornar_json()
for keys in json_retornado:
    print(keys)