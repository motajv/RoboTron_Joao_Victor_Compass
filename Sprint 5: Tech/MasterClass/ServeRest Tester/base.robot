# Sessão para configuração, documentação, imports de arquivos e library's
* Settings *
Documentation       Arquivo simples para requisição HTTP em APIs Resposta
Library             RequestsLibrary
Library	            JSONLibrary
Resource            ./usuarios_keywords.robot
Resource            ./login_keywords.robot
Resource            ./produtos_keywords.robot
Resource            ./carrinho_keywords.robot

# Sessão para criação dos cenarios de teste
* Test Cases *
Cenário: GET Todos os Usuarios 200
    [tags]      GET_USER
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade "${6}"

Cenário: POST Cadastrar Usuario 201
    [tags]      POST_USER
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenário: PUT Editar Usuario 200
    [tags]      PUT_USER
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenário: DELETE Deletar Usuario 200
    [tags]      DELETE_USER
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenário: POST Realizar login 200
    [tags]      POST_LOGIN
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"

Cenário: POST Criar Produto 201
    [tags]      POST_PRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenário: DELETE Excluir Produto 200
    [tags]      DELETE_PRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"

Cenário: POST Criar Usuario de Massa Estatica Valido 201
    [tags]      POST_USERESTATICVAL
    Criar Sessao
    Criar Usuario Estatico Valido
    Validar Status Code "201"

Cenario: GET Listar Todos Carrinhos 200
    [tags]     GET_CARRINHOS                    
    Criar Sessao
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenario: GET Carrinho Especifico 200
    [tags]     GET_CARRINHO                     
    Criar Sessao
    Listar carrinhos e pegar um id valido
    GET Endpoint /carrinhos/${id_carrinho}
    Validar Status Code "200"

Cenario: POST Criar Carrinho 200
    [tags]     POST_CARRINHO                    
    Criar Sessao
    Fazer Login e Armazenar Token
    Adicionar um Produto ao Carrinho
    POST Endpoint /carrinhos     ${token_auth}
    Validar Status Code "201"
    Validar a Mensagem "Cadastro realizado com sucesso"

Cenario: DELETE Excluir Carrinho Concluir Compra Com Carrinho 200
    [tags]     DELETE_COM_CARRINHO_CONCLUIR
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos      concluir-compra    ${token_auth}
    Validar Status Code "200"
    Validar a Mensagem "Registro excluído com sucesso"

Cenario: DELETE Excluir Carrinho Cancelar Compra Com Carrinho 200
    [tags]     DELETE_COM_CARRINHO_CANCELAR     
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos      cancelar-compra    ${token_auth}
    Validar Status Code "200"
    Validar a Mensagem "Registro excluído com sucesso. Estoque dos produtos reabastecido"

# Sessão para criação de Keywords Personalizadas
* Keywords *
Criar Sessao
    Create Session          serverest   http://localhost:3000/


