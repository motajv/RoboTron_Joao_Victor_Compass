# Q12) Printe somente o nome dos atores que ganharam o Oscar em 1991 e 2016.
import pandas as pd

arquivo = pd.read_csv('CSV.csv', encoding='UTF-8', sep=",")
arquivo_atores = arquivo[(arquivo["Year"] == 1991) | (arquivo["Year"] == 2016)]

print(arquivo_atores["Name"])