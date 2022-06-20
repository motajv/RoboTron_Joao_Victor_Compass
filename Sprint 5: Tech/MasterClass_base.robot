# Sessão para configuração, documentação, imports de arquivos e library's
* Settings *
Documentation       Arquivo simples para requisição HTTP em APIs Resposta
Library             RequestsLibrary

# Sessão para configuração de variáveis para utilização
* Variables *

# Sessão para criação dos cenarios de teste
* Test Cases *
Cenário: GET Todos os Usuarios 200
    [tags]      GET
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade "${32}"

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
    &{payload}               Create Dictionary       nome=Daniele Sousa         email=sousadani@compass.com        password=calabresa     administrador=true
    ${response}              POST On Session      serverest       /usuarios     data=&{payload}
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

PUT Endpoint /usuarios
    &{payload}               Create Dictionary       nome=Mabia Mota           email=mabia mota@compass.com        password=123        administrador=true
    ${response}              PUT On Session      serverest       /usuarios/pX4S6V3I9hncC6Tl     data=&{payload}
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
