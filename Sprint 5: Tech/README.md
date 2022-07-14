## ServeRest API
 
    O presente código apresenta a automação de testes para as validações de cobertura referente a API ServeRest, uma API Rest gratuita que simula uma loja virtual com intuito de servir como material de estudos de testes de API.
    Alertamos que não é permitido a exclusão ou alteração dos arquivos atuais, apenas sua complementação, através da criação de novos cenários.
 

:shopping_cart: https://serverest.dev/


## Endpoints
- :heavy_check_mark: Login
- :heavy_check_mark: Usuários
- :heavy_check_mark: Produtos
- :heavy_check_mark: Carrinhos


## Instalações

- Instalar o Python
- Instalar o driver do navegador e adicionar ao path nas variáveis de ambiente do sistema
- Instalar o Robot Framework: pip install robotframework


## Libraries externas utilizadas

- RequestsLibrary
- JSONLibrary


## Execução dos testes

- Executar no terminal dentro do diretório "tests" os arquivos: 

  - Para teste de login: robot -d ./reports_login 00_login_tests.robot;
    
  - Para teste de usuários: robot -d ./reports_usuarios 01_usuarios_tests.robot
    
  - Para teste de produtos: robot -d ./reports_produtos 02_produtos_tests.robot
    
  - Para teste de carrinhos: robot -d ./reports_carrinhos 03_carrinhos_tests.robot

## Resultado dos testes

- Acessar o arquivo *log.html* na pasta *report* referente ao teste executado.