* Settings *
Documentation                   Keywords e Variables para Ações do Endpoint de Produtos
Resource            ../support/base.robot

* Keywords *
GET Endpoint /produtos
    ${response}             GET On Session      serverest   /produtos
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /produtos
    &{header}                Create Dictionary       Authorization=${token_auth}
    &{payload}               Create Dictionary       nome=Iphone 12        preco=4900         descricao=Smartphone      quantidade=200
    ${response}              POST On Session      serverest       /produtos     data=&{payload}      headers=${header}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

DELETE Endpoint /produtos
    &{header}                Create Dictionary       Authorization=${token_auth}
    ${response}              DELETE On Session      serverest       /produtos/${id_produto}     headers=${header}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

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
