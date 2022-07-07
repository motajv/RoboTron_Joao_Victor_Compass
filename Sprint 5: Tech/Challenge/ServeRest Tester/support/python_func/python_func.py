from urllib import response
import requests as req
from faker import Faker

def Apresentar_Quantidade_de_Produtos_Cadastrados():
    r = req.get("http://localhost:3000/produtos")
    conv_json = r.json()
    return conv_json["quantidade"]

fake = Faker('pt-BR')
headers = {'Accept': "application/json", 'monitor': 'false'}

def Criar_Usuarios_Para_Teste_de_Carga(carga):
    lista = []
    for i in range(0, carga):
        r = req.post("http://localhost:3000/usuarios", headers=headers, data = {"nome": fake.name(),"email": fake.email(),"password": fake.password(),"administrador": "true"})
        conv_json = r.json()
        lista.append(conv_json)
    return lista

def Apresentar_Quantidade_de_Usuarios_Cadastrados():
    r = req.get("http://localhost:3000/usuarios")
    conv_json = r.json()
    return conv_json["quantidade"]
