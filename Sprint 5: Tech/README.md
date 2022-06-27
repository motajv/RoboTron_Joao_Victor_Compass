# ServeRest API

O ServeRest é uma API REST que simula uma loja virtual para servir de material de estudos de testes de API

:shopping_cart: https://serverest.dev/


## Endpoints
:heavy_check_mark: Login
:heavy_check_mark: Usuários
:heavy_check_mark: Produtos
:heavy_check_mark: Carrinhos

## Instalação

- Instalar o Python
- Instalar o driver do navegador e adicionar ao path nas variáveis de ambiente do sistema
- Instalar as dependências do Robot Framework: `python -m pip install -r requirements.txt`

## Libraries externas utilizadas

- RequestsLibrary
- JSONLibrary

## Execução dos testes

- Executar no terminal: `robot -d ./report_base -i [tag] base.robot`

## Resultado dos testes

- Acessar o arquivo *log.html* na pasta *report_base*