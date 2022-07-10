# Sessão para configuração, documentação, imports de arquivos e library's
* Settings *
Documentation       Arquivo de Testes para o Endpoint /carrinhos
Resource            ../keywords/03_carrinho_keywords.robot

Suite Setup         Criar Sessao

# Sessão para criação dos cenarios de teste
* Test Cases *
Cenario: GET Listar Todos Carrinhos 200
    [tags]     GET_CARRINHOS                    
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenario: GET Carrinho Especifico 200
    [tags]     GET_CARRINHO                     
    Listar carrinhos e pegar um id valido
    GET Endpoint /carrinhos/${id_carrinho}
    Validar Status Code "200"

Cenario: POST Criar Carrinho 201
    [tags]     POST_CARRINHO                    
    Fazer Login e Armazenar Token
    Encontrar ID de um Produto Cadastrado
    Adicionar um Produto ao Carrinho
    POST Endpoint /carrinhos
    Validar Status Code "201"
    Validar Ter Criado Carrinho

Cenario: POST Criar Carrinho 400
    [tags]     POST_CARRINHO_DUPLICADO                     
    Fazer Login e Armazenar Token
    Encontrar ID de um Produto Cadastrado
    Adicionar um Produto ao Carrinho
    POST Endpoint /carrinhos Algo Deu Errado
    Validar Status Code "400"

Cenario: DELETE Excluir Carrinho Concluir Compra Com Carrinho 200
    [tags]     DELETE_CONCLUIR
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos
    Validar Status Code "200"
    Validar a Mensagem "Registro excluído com sucesso"

Cenario: DELETE Excluir Carrinho Cancelar Compra Com Carrinho 200
    [tags]     DELETE_CANCELAR     
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos
    Validar Status Code "200"
    Validar a Mensagem "Registro excluído com sucesso. Estoque dos produtos reabastecido"