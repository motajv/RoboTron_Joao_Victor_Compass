# Sessão para configuração, documentação, imports de arquivos e library's
* Settings *
Documentation       Arquivo simples para requisição HTTP em APIs Resposta
Library             RequestsLibrary


# Sessão para configuração de variáveis para utilização
* Variables *
${nome_usuario}         João Victor
${senha_usuario}        jv123mota
${email_usuario}        jmota@compass.com


# Sessão para criação dos cenarios de teste
* Test Cases *
Cenário: GET Todos os Usuarios 200
    [tags]      GET
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade "${36}"
    Printar Conteudo Response

Cenário: POST Cadastrar Usuario 201
    [tags]      POST
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenário: PUT Editar Usuario 200
    [tags]      PUT
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenário: DELETE Deletar Usuario 200
    [tags]      DELETE
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code "200"


# Sessão para criação de Keywords Personalizadas
* Keywords *
Criar Sessao
    Create Session          serverest   https://serverest.dev

GET Endpoint /usuarios
    ${response}              GET On Session      serverest       /usuarios
    Set Global Variable      ${response}

POST Endpoint /usuarios
    &{payload}               Create Dictionary       nome=Juca Pirama         email=jucapirama@compass.com        password=calabresa     administrador=true
    ${response}              POST On Session      serverest       /usuarios     data=&{payload}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

PUT Endpoint /usuarios
    &{payload}               Create Dictionary       nome=Arnold Pirama           email=arnoldpirama@compass.com        password=123        administrador=true
    ${response}              PUT On Session      serverest       /usuarios/TA3yVuAfpILn5Dah   data=&{payload}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

DELETE Endpoint /usuarios
    ${response}              DELETE On Session      serverest       /usuarios/pX4S6V3I9hncC6Tl
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

Validar Status Code "${statuscode}"
    Should Be true          ${response.status_code} == ${statuscode}

Validar Quantidade "${quantidade}"
    Should Be Equal         ${response.json()["quantidade"]}        ${quantidade}

Validar Se Mensagem Contem "${palavra}"
    Should Contain       ${response.json()["message"]}           ${palavra}

Printar Conteudo Response
    Log To Console       Response: ${response.json()["usuarios"][1]["nome"]}
