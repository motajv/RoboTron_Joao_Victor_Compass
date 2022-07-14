# Q3) Do JSON 1 Guarde apenas o Nome do Estádio, o Placar e o Status do jogo dentro de variáveis e mostre-as.
import json

def retornar_json():
    with open("JSON1.json", encoding="utf-8") as partida:
        json_manipulavel = json.load(partida)
        return json_manipulavel
json_retornado = retornar_json()
#print(json_retornado['copa-do-brasil'][0]['time_mandante']['nome_popular'])
nome_estadio = json_retornado['copa-do-brasil'][0]['estadio']['nome_popular']
placar = json_retornado['copa-do-brasil'][0]['placar']
status = json_retornado['copa-do-brasil'][0]['status']
print("Nome do Estádio: {}\nPlacar: {}\nStatus: {}" .format(nome_estadio, placar, status))