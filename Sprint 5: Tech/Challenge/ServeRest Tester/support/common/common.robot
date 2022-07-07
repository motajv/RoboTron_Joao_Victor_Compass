* Settings *
Documentation                   Keywords e Variables para Ações do Gerais
Resource            ../base.robot

* Keywords *
Validar Status Code "${statuscode}"
    Should Be true          ${response.status_code} == ${statuscode}

Importar JSON Estatico
    [Arguments]             ${nome_arquivo}
    ${arquivo}              Get File        	${EXECDIR}/../support/fixtures/static/${nome_arquivo}
    ${data}                 Evaluate        	json.loads('''${arquivo}''')     	json
    [return]                ${data}

Validar a Mensagem "${mensagem}"
    Should Be Equal         ${response.json()["message"]}   ${mensagem}

Validar Se Mensagem Contem "${palavra}"
    Should Contain          ${response.json()["message"]}           ${palavra}



    