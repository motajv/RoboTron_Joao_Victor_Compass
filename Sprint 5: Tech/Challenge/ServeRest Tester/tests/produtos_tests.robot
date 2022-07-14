### Sessão para configuração, documentação, imports de arquivos e library's
*** Settings ***
Documentation       Arquivo de Testes para o Endpoint /produtos
Resource            ../keywords/02_produtos_keywords.robot
Resource            ../support/base.robot

Suite Setup         Criar Sessao

### Sessão para criação dos cenarios de teste
*** Test Cases ***
###--------------------CT06 - Validar listagem de produtos--------------------###
Cenário: GET Listar Todos os Produtos 200
    [tags]      GET_PRODUTO
    GET Endpoint /produtos
    Validar Status Code "200"

Cenário: GET Listar Produto Especifico 200
    [tags]      GET_PRODUTO_ID
    GET Endpoint /produtos Especifico 
    Validar Status Code "200"

Cenário: GET Produto ID Invalido 400
    [tags]      GET_PRODUTO_INVALIDO
    GET Endpoint /produtos Invalido
    Validar Status Code "400"

###--------------------CT07 - Validar cadastro de produtos--------------------###
Cenário: POST Criar Produto 201
    [tags]      POST_PRODUTO_ADM
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    POST Endpoint /produtos
    Validar Status Code "201"

Cenário: POST Criar Produto Existente 400
    [tags]      POST_PRODUTO_EXISTENTE
    Fazer Login e Armazenar Token
    POST Endpoint /produtos Existente
    Validar Status Code "400"

Cenário: POST Criar Produto Erro TOKEN 401
    [tags]      POST_PRODUTO_TOKEN
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    POST Endpoint /produtos TOKEN
    Validar Status Code "401"

Cenário: POST Criar Produto Rota Exclusiva 403
    [tags]      POST_PRODUTO
    Fazer Login e Armazenar Token Nao Administrador
    Criar Dados Produto Valido
    POST Endpoint /produtos Rota Exclusiva para Administradores
    Validar Status Code "403"

###--------------------CT08 - Validar edição de produtos--------------------###
Cenário: PUT Editar Produto 200
    [tags]      PUT_PRODUTO_ADM
    Fazer Login e Armazenar Token
    Encontrar ID de um Produto Cadastrado
    Criar Dados Produto Valido
    PUT Endpoint /produtos
    Validar Status Code "200"

Cenário: PUT Cadastrar Produto 201

Cenário: PUT Editar Produto Nome Existente 400
    [tags]       PUT_PRODUTO_EXISTENTE
    Fazer Login e Armazenar Token
    Encontrar ID de um Produto Cadastrado
    PUT Endpoint /produtos Existente
    Validar Status Code "400"

Cenário: PUT Editar Produto Token Ausente, Invalido ou Expirado 401
    [tags]      PUT_PRODUTO_TOKEN
    Fazer Login e Armazenar Token
    Encontrar ID de um Produto Cadastrado
    Criar Dados Produto Valido
    PUT Endpoint /produtos Token Invalido
    Validar Status Code "401"

Cenário: PUT Editar Produto Rota Exclusiva 403
    [tags]      PUT_PRODUTO
    Fazer Login e Armazenar Token Nao Administrador
    Encontrar ID de um Produto Cadastrado
    Criar Dados Produto Valido
    PUT Endpoint /produtos Rota Exclusiva para Administradores
    Validar Status Code "403"

###--------------------CT09 - Validar exclusão de produtos--------------------###
Cenário: DELETE Excluir Produto 200
    [tags]      DELETE_PRODUTO_ADM
    Fazer Login e Armazenar Token
    Criar Um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"

Cenário: DELETE Excluir Produto Carrinho 400
    [tags]      DELETE_PRODUTO_CARRINHO
    Fazer Login e Armazenar Token
    Encontrar ID de um Produto Cadastrado
    DELETE Endpoint /produtos
    Validar Status Code "400"

Cenário: DELETE Excluir Produto Token Invalido 401
    [tags]      DELETE_PRODUTO_TOKEN
    Fazer Login e Armazenar Token
    Encontrar ID de um Produto Cadastrado
    DELETE Endpoint /produtos Token Invalido
    Validar Status Code "401"

Cenário: DELETE Excluir Produto Rota Exclusiva 403
    [tags]      DELETE_PRODUTO
    Fazer Login e Armazenar Token Nao Administrador
    Criar Um Produto e Armazenar ID
    DELETE Endpoint /produtos Rota Exclusiva para Administradores
    Validar Status Code "403"