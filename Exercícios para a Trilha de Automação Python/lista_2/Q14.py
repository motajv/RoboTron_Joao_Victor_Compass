# Q14) Printe todos os nomes e as idades dos atores que ganharam o oscar de 1987 até 1999.
import pandas as pd

import pandas as pd

arquivo = pd.read_csv('CSV.csv', encoding='UTF-8', sep=",")
arquivo_year = arquivo['Year']
arquivo_atores = arquivo[(arquivo["Year"] == 1987) > (arquivo["Year"] == 1999)]

print("Ator: {} " .format(arquivo_atores["Name"]), "Idade: {}" .format(arquivo_atores["Age"].map(str)))

