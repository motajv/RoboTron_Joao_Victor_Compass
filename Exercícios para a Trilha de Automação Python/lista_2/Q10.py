# Q10) Usando Pandas, procure por um dado específico (da sua escolha) e printe somente o mesmo utilizando o CSV.
import pandas as pd

arquivo = pd.read_csv('CSV.csv', encoding='UTF-8', sep=",")
#print(arquivo)
# Mostrar ganhadores do Oscar que possuiam 34 anos:
print(arquivo[arquivo["Age"] == 34])