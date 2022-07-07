# Sessão para configuração, documentação, imports de arquivos e library's
* Settings *
Documentation       Arquivo de Testes para o Endpoint /produtos
Resource            ../keywords/produtos_keywords.robot

Suite Setup         Criar Sessao

# Sessão para criação dos cenarios de teste
* Test Cases *
Cenário: GET Listar Todos os Produtos 200
    [tags]      GET_PRODUTO
    GET Endpoint /produtos
    Validar Status Code "200"

Cenário: POST Criar Produto 201
    [tags]      POST_PRODUTO
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenário: DELETE Excluir Produto 200
    [tags]      DELETE_PRODUTO
    Fazer Login e Armazenar Token
    Criar Um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"