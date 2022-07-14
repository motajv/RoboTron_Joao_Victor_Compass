*** Settings ***
Documentation        Keywords e Variables para Ações do Endpoint de Usuários
Resource            ../support/base.robot

*** Keywords ***
###------------------------------------------------------------GET------------------------------------------------------------###
GET Endpoint /usuarios
    ${response}              GET On Session      serverest       /usuarios
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

GET Endpoint /usuarios Especifico 
    ${response}             GET On Session     serverest         /usuarios/${ID_USER} 
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /usuarios Invalido
    ${response}             GET On Session     serverest         /usuarios/asygdfleçc     expected_status=400
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /usuarios Administradores 
    &{HEADERS}              Create Dictionary        Content-Type=application/json
    ${response}             Get On Session           serverest   /usuarios      headers=${HEADERS}     params=administrador=true
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /usuarios Nao Administradores 
    &{HEADERS}              Create Dictionary        Content-Type=application/json
    ${response}             Get On Session           serverest   /usuarios      headers=${HEADERS}     params=administrador=false
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

###------------------------------------------------------------POST------------------------------------------------------------###
POST Endpoint /usuarios
    ${response}              POST On Session      serverest       /usuarios         json=&{payload}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

POST Endpoint /usuarios Invalido                 
    ${response}              POST On Session      serverest       /usuarios         json=&{payload}     expected_status=400
    Log to Console                                           ${response.json()['message']}
    Set Global Variable      ${response}

###------------------------------------------------------------PUT------------------------------------------------------------###
PUT Endpoint /usuarios
    ${response}              PUT On Session      serverest       /usuarios/${response.json()["_id"]}   data=&{payload}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

PUT Endpoint /usuarios Cadastrado
    ${response}              POST On Session      serverest       /usuarios     data=&{payload}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

PUT Endpoint /usuarios Email
    ${payload}               Create Dictionary                   nome=Fabio Luis    email=mv@gmail.com      password=qateste    administrador=false
    ${response}              PUT On Session      serverest       /usuarios/7TH6LoS53DTRI1II   data=&{payload}      expected_status=400
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

###------------------------------------------------------------DELETE------------------------------------------------------------###
DELETE Endpoint /usuarios
    ${response}              DELETE On Session      serverest       /usuarios/${response.json()["_id"]}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

DELETE Endpoint /usuarios Carrinho Cadastrado
    ${response}              DELETE On Session      serverest       /usuarios/7TH6LoS53DTRI1II          expected_status=400
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

###------------------------------------------------------------GERAIS------------------------------------------------------------###
Criar ${tipo_de_usuario} Estatico
    ${json}                 Importar JSON Estatico      json_usuario_ex.json
    ${payload}              Set Variable                ${json["${tipo_de_usuario}"]}
    Set Global Variable     ${payload}

Cadastrar ${tipo_de_usuario} e Armazenar ID
    Criar ${tipo_de_usuario} estatico
    POST Endpoint /usuarios
    ${id_usuario}           Set Variable    ${response.json()["_id"]}
    Set Global Variable     ${id_usuario}

Pegar Dados Usuario Estatico Invalido
    ${json}                 Importar JSON Estatico      json_usuario_ex.json
    ${payload}              Set Variable                ${json["user_invalido"]}
    Set Global Variable     ${payload}

Pegar Dados ${tipo_de_usuario} Estatico
    ${json}                 Importar JSON estatico      json_usuario_ex.json
    ${payload}              Set Variable       ${json["${tipo_de_usuario}"]}
    Set Global Variable     ${payload}

Pegar Dados Usuario Estatico Valido
    ${json}                 Importar JSON Estatico      json_usuario_ex.json
    ${payload}              Set Variable                ${json["user_valido"]}
    Set Global Variable     ${payload}

Cadastrar Usuario Dinamico Valido
    ${payload}              Criar Dados Usuario Valido
    Set Global Variable     ${payload}
    POST Endpoint /usuarios



