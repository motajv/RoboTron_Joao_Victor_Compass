* Settings *
Documentation        Keywords e Variables para Ações do Endpoint de Usuários
Resource            ../support/base.robot

* Keywords *
GET Endpoint /usuarios
    ${response}              GET On Session      serverest       /usuarios
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

GET Endpoint /usuarios especifico 
    [Arguments]             ${id_usuario}
    ${response}             GET On Session     serverest   /usuarios/${id_usuario}     expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /usuarios
    ${response}              POST On Session      serverest       /usuarios         json=&{payload}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

POST Endpoint /usuarios Invalido 
    #&{payload}               Create Dictionary       nome=Francisco Fulano        email=fulano@qa.com         password=123test      administrador=true                
    ${response}              POST On Session      serverest       /usuarios         json=&{payload}     expected_status=400
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

PUT Endpoint /usuarios
    ${response}              PUT On Session      serverest       /usuarios/${response.json()["_id"]}   data=&{payload}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

DELETE Endpoint /usuarios
    ${response}              DELETE On Session      serverest       /usuarios/${response.json()["_id"]}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

Cadastrar ${tipo_de_usuario} e Armazenar ID
    Criar ${tipo_de_usuario} estatico
    POST Endpoint /usuarios
    ${id_usuario}           Set Variable    ${response.json()["_id"]}
    Set Global Variable     ${id_usuario}

Pegar Dados Usuario Estatico Invalido
    ${json}                 Importar JSON Estatico      json_usuario_ex.json
    ${payload}              Set Variable                ${json["user_invalido"]}
    Set Global Variable     ${payload}

Pegar Dados Usuario Estatico Valido
    ${json}                 Importar JSON Estatico      json_usuario_ex.json
    ${payload}              Set Variable                ${json["user_valido"]}
    Set Global Variable     ${payload}

Cadastrar Usuario Dinamico Valido
    ${payload}              Criar Dados Usuario Valido
    Set Global Variable     ${payload}
    POST Endpoint /usuarios


