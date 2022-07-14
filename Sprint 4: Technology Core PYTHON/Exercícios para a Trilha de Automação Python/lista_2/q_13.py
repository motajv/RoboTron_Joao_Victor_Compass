# Q13) Crie mais uma coluna em tempo de execução juntando os dados movie e year.
import pandas as pd

arquivo = pd.read_csv('CSV.csv', encoding='UTF-8', sep=",")
arquivo["Movie_Year"] = arquivo["Movie"] + " lançado em " + arquivo["Year"].map(str)

print(arquivo)

