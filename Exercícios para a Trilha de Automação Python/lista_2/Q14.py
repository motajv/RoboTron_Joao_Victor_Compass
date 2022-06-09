# Q14) Printe todos os nomes e as idades dos atores que ganharam o oscar de 1987 até 1999.
import pandas as pd

import pandas as pd

arquivo = pd.read_csv('CSV.csv', encoding='UTF-8', sep=",")
arquivo_year = arquivo['Year']
arquivo_atores = arquivo.loc[59:71]

print(arquivo_atores[['Name', 'Age']])
