# Sessão para configuração, documentação, imports de arquivos e library's
* Settings *
Documentation       Arquivo de Testes para o Endpoint /login
Resource            ../keywords/login_keywords.robot

Suite Setup         Criar Sessao

# Sessão para criação dos cenarios de teste
* Test Cases *
Cenário: POST Realizar login 200
    [tags]      POST_LOGIN
    POST Endpoint /login
    Validar Status Code "200"