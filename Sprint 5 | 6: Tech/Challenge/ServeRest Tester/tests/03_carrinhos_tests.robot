# Sessão para configuração, documentação, imports de arquivos e library's
* Settings *
Documentation       Arquivo de Testes para o Endpoint /carrinhos
Resource            ../keywords/03_carrinho_keywords.robot

Suite Setup         Criar Sessao

# Sessão para criação dos cenarios de teste
* Test Cases *
###--------------------CT10 - Validar listagem de carrinhos--------------------###
Cenario: GET Listar Todos Carrinhos 200
    [tags]     GET_CARRINHO                   
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenario: GET Carrinho Especifico 200
    [tags]     GET_CARRINHO_ID      
    Listar Carrinhos e Armazenar ID               
    GET Endpoint /carrinhos Especifico
    Validar Status Code "200"

Cenario: GET Carrinho ID Invalida 400
    [tags]     GET_CARRINHO_ID_INVALIDA                     
    GET Endpoint /carrinhos ID Invalida
    Validar Status Code "400"

###--------------------CT10 - Validar cadastro de carrinhos--------------------###
Cenario: POST Criar Carrinho 201
    [tags]     POST_CARRINHO                    
    Fazer Login e Armazenar Token Nao Administrador
    Criar Dados Produto Valido
    Encontrar ID de um Produto Cadastrado
    Adicionar um Produto ao Carrinho
    POST Endpoint /carrinhos
    Validar Status Code "201"
    Validar Ter Criado Carrinho

Cenario: POST Criar Carrinho 201
    [tags]     POST_CARRINHO_ADM                    
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    Encontrar ID de um Produto Cadastrado
    Adicionar um Produto ao Carrinho
    POST Endpoint /carrinhos
    Validar Status Code "201"
    Validar Ter Criado Carrinho

Cenario: POST Criar Carrinho Invalido 400
    [tags]     POST_CARRINHO_DUPLICADO                     
    Fazer Login e Armazenar Token
    Encontrar ID de um Produto Cadastrado
    Adicionar um Produto ao Carrinho
    POST Endpoint /carrinhos Algo Deu Errado
    Validar Status Code "400"

Cenario: POST Criar Carrinho Erro Token 401
    [tags]     POST_CARRINHO_TOKEN                    
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    Encontrar ID de um Produto Cadastrado
    Adicionar um Produto ao Carrinho
    POST Endpoint /carrinhos Erro Token
    Validar Status Code "401"

###--------------------CT10 - Validar exclusão de carrinhos--------------------###
Cenario: DELETE Excluir Carrinho Concluir Compra Com Carrinho 200
    [tags]     DELETE_CONCLUIR
    Fazer Login e Armazenar Token Nao Administrador
    DELETE Endpoint /carrinhos Concluir Compra
    Validar Status Code "200"
    Validar Se Mensagem Contem "Registro excluído com sucesso."

Cenario: DELETE Excluir Carrinho Cancelar Compra Com Carrinho 200
    [tags]     DELETE_CANCELAR     
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos Cancelar Compra
    Validar Status Code "200"
    Validar Se Mensagem Contem "Registro excluído com sucesso."

Cenario: DELETE Excluir Carrinho Concluir Compra Com Carrinho Erro Token 401
    [tags]     DELETE_CONCLUIR_TOKEN
    Fazer Login e Armazenar Token Nao Administrador
    DELETE Endpoint /carrinhos Concluir Compra Erro Token
    Validar Status Code "401"
    Validar Se Mensagem Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenario: DELETE Excluir Carrinho Cancelar Compra Com Carrinho Erro Token 401
    [tags]     DELETE_CANCELAR_TOKEN
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos Concluir Compra Erro Token
    Validar Status Code "401"
    Validar Se Mensagem Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"