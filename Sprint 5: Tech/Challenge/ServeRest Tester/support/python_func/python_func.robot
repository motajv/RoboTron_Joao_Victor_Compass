*** Settings ***
Documentation               Arquivo de Testes para Library PYTHON
Library                     python_func.py

*** Test Cases ***
###--------------------CT06 - Validar listagem de produtos--------------------###
Cenário: Apresentar Quantidade de Produtos Cadastrados
    [tags]                  FUNCTION_PRODUTOS
    ${produtos}             Apresentar Quantidade de Produtos Cadastrados
    Log To Console          ${produtos}

###--------------------CT13 - Teste de carga--------------------###
Cenário: Criar Usuarios Para Teste de Carga
    [tags]                  FUNCTION_CARGA
    ${usuarios}             Criar Usuarios Para Teste de Carga      ${10}
    Log To Console          ${usuarios}  

###--------------------CT02 - Validar listagem de usuários--------------------###
Cenário: Apresentar Quantidade de Usuarios Cadastrados
    [tags]                  FUNCTION_USUARIOS
    ${usuarios}             Apresentar Quantidade de Usuarios Cadastrados
    Log To Console          ${usuarios}