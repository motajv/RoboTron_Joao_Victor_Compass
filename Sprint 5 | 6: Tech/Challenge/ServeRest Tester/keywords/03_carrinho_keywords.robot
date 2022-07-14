*** Settings ***
Documentation       Keywords e Variáveis para ações do Endpoint de Carrinhos
Resource            ../support/base.robot

*** Variables ***
${quantidade}       1


*** Keywords ***
###------------------------------------------------------------GET------------------------------------------------------------###
GET Endpoint /carrinhos
    ${response}             GET On Session      serverest   /carrinhos
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /carrinhos Especifico
    ${response}             GET On Session      serverest   /carrinhos/${id_carrinho}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /carrinhos ID Invalida
    ${response}             GET On Session      serverest   /carrinhos/ID_INVALIDO          expected_status=400
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

###------------------------------------------------------------POST------------------------------------------------------------###
POST Endpoint /carrinhos
    &{header}               Create Dictionary    Authorization=${token_auth}
    ${response}             POST On Session      serverest   /carrinhos    json=&{json}     headers=${header}        expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /carrinhos Algo Deu Errado
    &{header}               Create Dictionary    Authorization=${token_auth}
    ${response}             POST On Session      serverest   /carrinhos    json=&{json}     headers=${header}        expected_status=400
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /carrinhos Erro Token
    &{header}               Create Dictionary    Authorization=${token_auth}
    ${response}             POST On Session      serverest   /carrinhos    json=&{json}     expected_status=401
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

###------------------------------------------------------------DELETE------------------------------------------------------------###
DELETE Endpoint /carrinhos Concluir Compra
    &{header}               Create Dictionary    Authorization=${token_auth}
    ${response}             DELETE On Session      serverest   /carrinhos/concluir-compra      headers=${header}        expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos Concluir Compra Erro Token
    &{header}               Create Dictionary    Authorization=${token_auth}
    ${response}             DELETE On Session      serverest   /carrinhos/concluir-compra      expected_status=401
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos Cancelar Compra
    &{header}               Create Dictionary    Authorization=${token_auth}
    ${response}             DELETE On Session      serverest   /carrinhos/cancelar-compra      headers=${header}        expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos Cancelar Compra Erro Token
    &{header}               Create Dictionary    Authorization=${token_auth}
    ${response}             DELETE On Session      serverest   /carrinhos/concluir-compra      expected_status=401
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

###------------------------------------------------------------GERAIS------------------------------------------------------------###
Adicionar um Produto ao Carrinho
    ${json}             Convert String to JSON      {"produtos": []}
    ${payload}          Create Dictionary           idProduto=${id_produto}   quantidade=${quantidade}
    ${json}             Add Object To Json	        ${json}	    $..produtos	    ${payload}
    Set Global Variable     ${json}

Validar Ter Criado Carrinho
    Should be Equal         ${response.json()["message"]}       Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]}

Listar Carrinhos e Armazenar ID  
    GET Endpoint /carrinhos
    ${id_carrinho}          Set Variable    ${response.json()["carrinhos"][0]["_id"]}
    Set Global Variable     ${id_carrinho}