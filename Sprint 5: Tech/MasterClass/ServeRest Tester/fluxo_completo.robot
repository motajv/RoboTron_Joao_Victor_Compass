# Sessão para configuração, documentação, imports de arquivos e library's
* Settings *
Documentation       Arquivo simples para requisição HTTP em APIs Resposta
Library             RequestsLibrary
Resource            ./usuarios_keywords.robot
Resource            ./login_keywords.robot
Resource            ./produtos_keywords.robot

* Test Cases *
Cenário: POST Cadastrar Usuario 201
    [tags]      POST
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenário: POST Realizar login 200
    [tags]      POSTLOGIN
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"

# Sessão para criação de Keywords Personalizadas
* Keywords *
Criar Sessao
    Create Session          serverest   http://localhost:3000/