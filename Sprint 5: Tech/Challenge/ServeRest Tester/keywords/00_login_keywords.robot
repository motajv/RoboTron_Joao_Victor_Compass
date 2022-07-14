*** Settings ***
Documentation                   Keywords e Variables para Ações do Endpoint de Usuários
Resource            ../support/base.robot

*** Variables ***
### Dados Usuario Administrador ###
${email_para_login_adm}          fulano@qa.com
${senha_para_login_adm}          nba123

### Dados Usuario Nao Administrador ###
${email_para_login}              anthony95@example.com
${senha_para_login}              aCc1Wnkq78

*** Keywords ***
###------------------------------------------------------------POST------------------------------------------------------------###
POST Endpoint /login
    &{payload}               Create Dictionary          email=${email_para_login_adm}           password=${senha_para_login_adm}
    ${response}              POST On Session            serverest              /login       data=&{payload}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

POST Endpoint /login Nao Administrador
    &{payload}               Create Dictionary          email=${email_para_login}           password=${senha_para_login}
    ${response}              POST On Session            serverest              /login       data=&{payload}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

POST Endpoint /login E-mail/Senha Invalido
    &{payload}               Create Dictionary          email=${email_para_login}           password=123teste
    ${response}              POST On Session            serverest             /login        data=&{payload}         expected_status=401
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

POST POST Endpoint /login E-mail/Senha Campo em Branco
    &{payload}               Create Dictionary       email=${email_para_login}              password=
    ${response}              POST On Session            serverest             /login        data=&{payload}         expected_status=400
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

###------------------------------------------------------------GERAIS------------------------------------------------------------###
Validar Ter Logado
    Should be Equal         ${response.json()["message"]}       Login realizado com sucesso
    Should Not Be Empty     ${response.json()["authorization"]}

# Cria autenticação dinâmica
Fazer Login e Armazenar Token
    POST Endpoint /login
    Validar Ter Logado
    ${token_auth}           Set Variable            ${response.json()["authorization"]}
    Log To Console          Token Salvo: ${token_auth}
    Set Global Variable     ${token_auth}

Fazer Login e Armazenar Token Nao Administrador
    POST Endpoint /login Nao Administrador
    Validar Ter Logado
    ${token_auth}           Set Variable            ${response.json()["authorization"]}
    Log To Console          Token Salvo: ${token_auth}
    Set Global Variable     ${token_auth}