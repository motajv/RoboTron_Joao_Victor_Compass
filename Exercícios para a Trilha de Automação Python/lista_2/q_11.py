# Q11) Printe o nome do Ator que ganhou o Oscar em 1993.
import pandas as pd

arquivo = pd.read_csv('CSV.csv', encoding='UTF-8', sep=",")
arquivo_ano = arquivo[arquivo["Year"] == 1993]

print(arquivo_ano["Name"])