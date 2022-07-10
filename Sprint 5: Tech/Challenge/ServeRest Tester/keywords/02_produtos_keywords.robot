*** Settings ***
Documentation                   Keywords e Variables para Ações do Endpoint de Produtos
Resource            ../support/base.robot

*** Keywords ***
###------------------------------------------------------------GET------------------------------------------------------------###
GET Endpoint /produtos
    ${response}             GET On Session      serverest   /produtos
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /produtos Especifico 
    ${response}             GET On Session     serverest         /produtos/${ID_PRODUTO}        expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /produtos Invalido
    ${response}             GET On Session     serverest         /produtos/id_invalida          expected_status=400
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

###------------------------------------------------------------POST------------------------------------------------------------###
POST Endpoint /produtos
    &{header}                Create Dictionary       Authorization=${token_auth}
    ${response}              POST On Session      serverest       /produtos     data=&{payload}      headers=${header}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

POST Endpoint /produtos Existente
    &{header}                Create Dictionary       Authorization=${token_auth}
    &{payload}               Create Dictionary       nome="Logitech MX Vertical"        preco=470       descricao="Mouse"       quantidade=381       
    ${response}              POST On Session      serverest       /produtos     data=&{payload}      headers=${header}          expected_status=400
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

POST Endpoint /produtos TOKEN
    &{header}                Create Dictionary       Authorization=${token_auth}
    ${response}              POST On Session      serverest       /produtos     data=&{payload}         expected_status=401
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

POST Endpoint /produtos Rota Exclusiva para Administradores 
    &{header}                Create Dictionary       Authorization=${token_auth}
    ${response}              POST On Session      serverest       /produtos     data=&{payload}      headers=${header}         expected_status=403
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

###------------------------------------------------------------PUT------------------------------------------------------------###
PUT Endpoint /produtos
    &{header}                Create Dictionary       Authorization=${token_auth}
    ${response}              PUT On Session      serverest       /produtos/${id_produto}    data=&{payload}      headers=${header}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

PUT Endpoint /produtos Token Invalido
    &{header}                Create Dictionary       Authorization=${token_auth}
    ${response}              PUT On Session      serverest       /produtos/${id_produto}    data=&{payload}     expected_status=401
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

###------------------------------------------------------------DELETE------------------------------------------------------------###
DELETE Endpoint /produtos
    &{header}                Create Dictionary       Authorization=${token_auth}
    ${response}              DELETE On Session      serverest       /produtos/${id_produto}     headers=${header}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

###------------------------------------------------------------GERAIS------------------------------------------------------------###
Encontrar ID de um Produto Cadastrado
    GET Endpoint /produtos
    ${id_produto}           Set Variable    ${response.json()["produtos"][0]["_id"]}
    Set Global Variable     ${id_produto}

Validar Ter Criado Produto
    Should be Equal         ${response.json()["message"]}       Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]}

Criar Um Produto e Armazenar ID
    POST Endpoint /produtos
    Validar Ter Criado Produto
    ${id_produto}           Set Variable            ${response.json()["_id"]}
    Log To Console          ID Produto: ${id_produto}
    Set Global Variable      ${id_produto}
