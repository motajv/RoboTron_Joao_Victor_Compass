# Sessão para configuração, documentação, imports de arquivos e library's
* Settings *
Documentation       Arquivo de Testes para o Endpoint /usuarios
Library             RequestsLibrary
Library             FakerLibrary
Library             Collections
Library             OperatingSystem
Library	            JSONLibrary

Suite Setup         Criar Sessao

* Variables *
${BASE_URI}         http://localhost:3000/

* Test Cases *
Cenario: POST Cadastrar Usuario Email Utilizado 400
    [tags]     POST_USER_EMAIL 
    Pegar Dados Usuario Estatico Invalido           
    POST Endpoint /usuarios
    Validar Status Code "400"

* Keywords *

Criar Sessao
    Create Session          serverest           ${BASE_URI}

Importar JSON Estatico
    [Arguments]             ${nome_arquivo}
    ${arquivo}              Get File        ${EXECDIR}/${nome_arquivo}
    ${data}                 Evaluate        json.loads('''${arquivo}''')     json
    [return]                ${data}

Pegar Dados Usuario Estatico Invalido
    ${json}                 Importar JSON Estatico      json_usuario_ex.json
    ${payload}              Set Variable                ${json["user_invalido"]}
    Set Global Variable     ${payload}


POST Endpoint /usuarios
    ${response}              POST On Session      serverest       /usuarios         json=&{payload}         expected_status=400
    Log to Console           Response: ${response.content}
    Set Global Variable      ${response}

Validar Status Code "${statuscode}"
    Should Be true          ${response.status_code} == ${statuscode}

Validar a Mensagem "${mensagem}"
    Should Be Equal         ${response.json()["message"]}   ${mensagem}

A API deve retornar status 400
    Should Be True  '${RESPONSE.status_code}'=='400'
    ...  msg=Erro na requisição! Verifique: ${RESPONSE}
    Should Be True  '${RESPONSE_BODY['message']}'=='Este email já está sendo usado'
