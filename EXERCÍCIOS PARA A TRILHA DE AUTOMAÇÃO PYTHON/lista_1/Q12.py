# Q12) Leia um valor inteiro correspondente à idade de uma pessoa em dias e informe-a em anos, meses e dias. Obs.: apenas para facilitar o cálculo, considere todo ano com 365 dias e todo mês com 30 dias. Nos casos de teste nunca haverá uma situação que permite 12 meses e alguns dias, como 360, 363 ou 364. Este é apenas um exercício com objetivo de testar raciocínio matemático simples.
idade = int(input('Digite o número referente à idade de uma pessoa em dias: '))

anos = int(idade/365)
dif_dias = idade - anos * 365

meses = int(dif_dias/30)
dias = dif_dias - meses * 30

print(anos, "ano(s)")
print(meses, "mes(es)")
print(dias, "dia(s)")
