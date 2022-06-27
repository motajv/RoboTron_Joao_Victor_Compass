* Settings *
Documentation       Keywords e Variáveis para ações do Endpoint de Carrinhos
Library	            JSONLibrary


* Variables *
${quantidade}       1


* Keywords *
GET Endpoint /carrinhos
    ${response}             GET On Session      serverest   /carrinhos
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /carrinhos/${id_carrinho}
    ${response}             GET On Session      serverest   /carrinhos/${id_carrinho}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /carrinhos
    [Arguments]             ${token_auth}
    &{header}               Create Dictionary    Authorization=${token_auth}
    ${response}             POST On Session      serverest   /carrinhos    json=&{json}     headers=${header}        expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos
    [Arguments]             ${tipo_compra}   ${token_auth}
    &{header}               Create Dictionary    Authorization=${token_auth}
    ${response}             DELETE On Session      serverest   /carrinhos/${tipo_compra}      headers=${header}        expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Adicionar um Produto ao Carrinho
    Encontrar ID de um Produto Cadastrado
    ${json}         Convert String to JSON      {"produtos": []}
    ${payload}              Create Dictionary   IDProduto=${id_produto}   quantidade=${quantidade}
    ${json}         Add Object To Json	        ${json}	    $..produtos	    ${payload}
    Set Global Variable     ${json}

Fazer Login e Adicionar Carrinho
    Fazer Login e Armazenar Token   
    Adicionar um Produto ao Carrinho
    POST Endpoint /carrinhos     ${token_auth}

Listar Carrinhos e Pegar um ID Valido
    GET Endpoint /carrinhos
    ${id_carrinho}          Set Variable    ${response.json()["carrinhos"][0]["_id"]}
    Set Global Variable     ${id_carrinho}