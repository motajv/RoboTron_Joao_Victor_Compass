* Settings *
Documentation               Arquivo de Testes para Library PYTHON
Library                     python_func.py

* Test Cases *
Cenário: Apresentar Quantidade de Produtos Cadastrados
    [tags]                  FUNCTION_PRODUTOS
    ${produtos}             Apresentar Quantidade de Produtos Cadastrados
    Log To Console          ${produtos}

Cenário: Criar Usuarios Para Teste de Carga
    [tags]                  FUNCTION_CARGA
    ${usuarios}             Criar Usuarios Para Teste de Carga      ${10}
    Log To Console          ${usuarios}  

Cenário: Apresentar Quantidade de Usuarios Cadastrados
    [tags]                  FUNCTION_USUARIOS
    ${usuarios}             Apresentar Quantidade de Usuarios Cadastrados
    Log To Console          ${usuarios}