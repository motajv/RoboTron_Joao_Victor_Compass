# Q15) Mostre todos os filmes menos o “The Revenant”.
import pandas as pd

arquivo = pd.read_csv('CSV.csv', encoding='UTF-8', sep=",")
filmes = arquivo[arquivo["Movie"] != "The Revenant"]

print(filmes)