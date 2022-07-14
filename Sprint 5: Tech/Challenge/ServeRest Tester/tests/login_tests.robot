### Sessão para configuração, documentação, imports de arquivos e library's
*** Settings ***
Documentation       Arquivo de Testes para o Endpoint /login
Resource            ../keywords/00_login_keywords.robot

Suite Setup         Criar Sessao

### Sessão para criação dos cenarios de teste
*** Test Cases ***
###--------------------CT01 - Validar login--------------------###
Cenário: POST Realizar login 200
    [tags]      POST_LOGIN_ADM
    POST Endpoint /login
    Validar Status Code "200"

Cenário: POST Realizar login Nao Administrador 200
    [tags]      POST_LOGIN
    POST Endpoint /login Nao Administrador
    Validar Status Code "200"

Cenário: POST Endpoint /login E-mail/Senha Invalido 400
    [tags]      POST_LOGIN_INVALIDO
    POST Endpoint /login E-mail/Senha Invalido
    Validar Status Code "401"

Cenário: POST Endpoint /login E-mail/Senha Campos em Branco 400
    [tags]      POST_LOGIN_BRANCO
    POST POST Endpoint /login E-mail/Senha Campo em Branco
    Validar Status Code "400"
