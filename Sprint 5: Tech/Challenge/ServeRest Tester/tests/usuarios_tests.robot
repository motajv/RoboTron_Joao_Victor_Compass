# Sessão para configuração, documentação, imports de arquivos e library's
* Settings *
Documentation       Arquivo de Testes para o Endpoint /usuarios
Resource            ../keywords/usuarios_keywords.robot

Suite Setup         Criar Sessao

# Sessão para criação dos cenarios de teste
* Test Cases *
Cenário: GET Todos os Usuarios 200
    [tags]      GET_USER
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenário: POST Cadastrar Usuario 201
    [tags]      POST_USER
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: POST Cadastrar Usuario Email Utilizado 400
    [tags]     POST_USER_EMAIL
    Pegar Dados Usuario Estatico Invalido            
    POST Endpoint /usuarios Invalido 
    Validar Status Code "400"
    Validar a Mensagem "Este email já está sendo usado"

Cenário: PUT Editar Usuario 200
    [tags]      PUT_USER
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code "200"
    
Cenário: DELETE Deletar Usuario 200
    [tags]      DELETE_USER
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenário: POST Criar Usuario de Massa Dinamica 201
    [tags]      POST_USER_DINAMICO
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"