* Test Cases *
Cenário: GET Todos os Usuarios 200
    GET Endpoint /usuarios
    Validar Todos os Usuarios na Response
    Validar Status Code "200"

Cenário: GET Usuario Especifico 200
    GET Endpoint /usuarios com id "/0uxuPY0cbmQhpEz1"
    Validar o Usuario com id "/0uxuPY0cbmQhpEz1"
    Validar Status Code "200"

Cenário: POST Criar Novo Usuario 201
    Criar Usuario Dinamico
    POST Usuario Dinamico no Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

Cenário: PUT Editar Usuario Existente 200
    PUT Editar Usuario com id "/0uxuPY0cbmQhpEz1" usando Dados Dinamicos
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"

Cenário: DELETE Apaga Usuario Existente 200
    DELETE Usuario Especifico com id "/0uxuPY0cbmQhpEz1"
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso | Nenhum registro excluído"
    