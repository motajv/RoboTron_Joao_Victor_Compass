# Q2) Pegue o arquivo JSON 1 e printe apenas o nome do time vencedor no terminal.
import json
# Criar uma função que lê o arquivo .json
def retornar_json():
    with open("JSON1.json", encoding="utf-8") as partida:
        json_manipulavel = json.load(partida)
        return json_manipulavel
json_retornado = retornar_json()
#print(json_retornado)
placar_mandante = json_retornado['copa-do-brasil'][0]['placar_mandante']
#print(placar_mandante)
placar_visitante = json_retornado['copa-do-brasil'][0]['placar_visitante']
#print(placar_visitante)
if placar_mandante > placar_visitante:
    time_vencedor = json_retornado['copa-do-brasil'][0]['time_mandante']['nome_popular']
    print("O time vencedor foi o {}".format(time_vencedor))
elif placar_mandante < placar_visitante:
    time_vencedor = json_retornado['copa-do-brasil'][0]['time_visitante']['nome_popular']
    print("O time vencedor foi o {}".format(time_vencedor))
else:
    print("O jogo terminou empatado!")
