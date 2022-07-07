* Settings *
Documentation                   Keywords e Variables para Ações do Endpoint de Usuários
Resource            ../support/base.robot

* Variables *
${email_para_login}          fulano@qa.com
${senha_para_login}          teste

* Keywords *
POST Endpoint /login
    &{payload}               Create Dictionary       email=${email_para_login}        password=${senha_para_login}
    ${response}              POST On Session      serverest       /login     data=&{payload}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

Validar Ter Logado
    Should be Equal         ${response.json()["message"]}       Login realizado com sucesso
    Should Not Be Empty     ${response.json()["authorization"]}

# Cria autenticação dinâmica
Fazer Login e Armazenar Token
    POST Endpoint /login
    Validar Ter Logado
    ${token_auth}           Set Variable            ${response.json()["authorization"]}
    Log To Console          Token Salvo: ${token_auth}
    Set Global Variable      ${token_auth}