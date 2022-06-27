* Settings *
Documentation        Keywords e Variables para Ações do Endpoint de Usuários
Resource            ./common.robot

* Variables *
${nome_usuario}         João Victor
${senha_usuario}        jv123mota
${email_usuario}        jmota@compass.com

* Keywords *
GET Endpoint /usuarios
    ${response}              GET On Session      serverest       /usuarios
    Set Global Variable      ${response}

POST Endpoint /usuarios
    &{payload}               Create Dictionary       nome=Jason Tatum           email=tatum@nba.com        password=nba2022        administrador=true
    ${response}              POST On Session      serverest       /usuarios     data=&{payload}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

PUT Endpoint /usuarios
    &{payload}               Create Dictionary       nome=Stephen Curry           email=curry@nba.com        password=2022nba        administrador=true
    ${response}              PUT On Session      serverest       /usuarios/6QvzfHMLGToOU6QI   data=&{payload}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

DELETE Endpoint /usuarios
    ${response}              DELETE On Session      serverest       /usuarios/pX4S6V3I9hncC6Tl
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

Validar Quantidade "${quantidade}"
    Should Be Equal         ${response.json()["quantidade"]}        ${quantidade}

Validar Se Mensagem Contem "${palavra}"
    Should Contain       ${response.json()["message"]}           ${palavra}

Criar Usuario Estatico Valido
    ${json}         Importar JSON Estatico  json_usuario_ex.json
    ${payload}      Set Variable            ${json["user_valido"]}
    Set Global Variable      ${payload}
    POST Endpoint /usuarios



