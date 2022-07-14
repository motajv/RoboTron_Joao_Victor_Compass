# Sessão para configuração, documentação, imports de arquivos e library's
*** Settings ***
Documentation       Arquivo de Testes para o Endpoint /usuarios
Resource            ../keywords/01_usuarios_keywords.robot

Suite Setup         Criar Sessao

### Sessão para criação dos cenários de teste
*** Test Cases ***
###--------------------CT02 - Validar listagem de usuários--------------------###
Cenário: GET Todos os Usuarios 200
    [tags]      GET_USUARIOS
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenário: GET Usuario Especifico 200
    [tags]      GET_USUARIO_ID                      
    GET Endpoint /usuarios Especifico   
    Validar Status Code "200"

Cenário: GET Usuarios Adminstradores 200
    [tags]      GET_USUARIO_ADM
    GET Endpoint /usuarios Administradores
    Validar Status Code "200"

Cenário: GET Usuarios Nao Adminstradores 200
    [tags]      GET_USUARIO_NAO_ADM
    GET Endpoint /usuarios Nao Administradores 
    Validar Status Code "200"

Cenário: GET Usuario ID Invalido 400
    [tags]      GET_USUARIO_ID_INVALIDO
    GET Endpoint /usuarios Invalido
    Validar Status Code "400"

###--------------------CT03 - Validar cadastro de usuários--------------------###
Cenário: POST Cadastrar Usuario 201
    [tags]      POST_USUARIO
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenário: POST Cadastrar Usuario Administrador 201 
    [tags]      POST_USUARIO_ADM
    Criar Dados Usuario Valido Administrador
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenário: POST Criar Usuario de Massa Estatica 201
    [tags]      POST_USUARIO_ESTATICO
    Criar user_valido Estatico
    POST Endpoint /usuarios
    Validar Status Code "201"

Cenário: POST Criar Usuario de Massa Dinamica 201
    [tags]      POST_USUARIO_DINAMICO
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"

Cenário: POST Cadastrar Usuario Email Utilizado 400
    [tags]     POST_USUARIO_EMAIL
    Pegar Dados user_invalido Estatico            
    POST Endpoint /usuarios Invalido 
    Validar Status Code "400"
    Validar a Mensagem "Este email já está sendo usado"

###--------------------CT04 - Validar edição de usuários--------------------###
Cenário: PUT Editar Usuario 200
    [tags]      PUT_USUARIO
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenário: PUT Cadastrar Usuario 201
    [tags]      PUT_USUARIO_CADASTRAR
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code "201"

Cenário: PUT Email Cadastrado 400
    [tags]      PUT_USUARIO_EMAIL
    PUT Endpoint /usuarios Email
    Validar Status Code "400"

###--------------------CT05 - Validar exclusão de usuários--------------------###
Cenário: DELETE Deletar Usuario 200
    [tags]      DELETE_USUARIO
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenário: DELETE Deletar Usuario com Carrinho Cadastrado 400
    [tags]      DELETE_USUARIO_CARRINHO
    DELETE Endpoint /usuarios Carrinho Cadastrado
    Validar Status Code "400"

