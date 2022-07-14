<h1 align="center">Teste de API - ServeRest</h1>

<h2 align="center">:shopping_cart: https://serverest.dev</h2>

> O presente código apresenta a automação de testes para as validações de cobertura referente a API ServeRest, uma API Rest gratuita que simula uma loja virtual com intuito de servir como material de estudos de testes de API.

> Alertamos que não é permitido a exclusão ou alteração dos arquivos atuais, apenas sua complementação, através da criação de novos cenários.

## Consumindo o ServeRest Localmente
### Localmente com NPM

Execute o seguinte comando no terminal:

```sh
npm install serverest
npx serverest
```

### Executando localmente temos o seguinte endereço:

```sh
url http://localhost:3000
```

## Endpoints
- :heavy_check_mark: /login
- :heavy_check_mark: /usuarios
- :heavy_check_mark: /produtos
- :heavy_check_mark: /carrinhos


## Requisitos para a criação de códigos de automação

- Instalar o Python
- Instalar o driver do navegador e adicionar ao path nas variáveis de ambiente do sistema
- Instalar o Robot Framework: pip install robotframework
- IDE para o desenvolvimento do código da automação de testes


## Libraries externas utilizadas

- RequestsLibrary
- JSONLibrary
- FakerLibrary
- Collections
- OperatingSystem


## Execução dos testes

- Executar no terminal dentro do diretório "tests" os arquivos: 

  - Para teste de [login](https://github.com/motajv/RoboTron_Joao_Victor_Compass/blob/main/Sprint%205%20%7C%206:%20Tech/Challenge/ServeRest%20Tester/tests/00_login_tests.robot): 
  ```sh
  robot -d ./reports_login 00_login_tests.robot
  ```
  - Para teste de [usuários](https://github.com/motajv/RoboTron_Joao_Victor_Compass/blob/main/Sprint%205%20%7C%206:%20Tech/Challenge/ServeRest%20Tester/tests/01_usuarios_tests.robot): 
  ```sh
  robot -d ./reports_usuarios 01_usuarios_tests.robot
  ```
  - Para teste de [produtos](https://github.com/motajv/RoboTron_Joao_Victor_Compass/blob/main/Sprint%205%20%7C%206:%20Tech/Challenge/ServeRest%20Tester/tests/02_produtos_tests.robot):
  ```sh
  robot -d ./reports_produtos 02_produtos_tests.robot
  ```
  - Para teste de [carrinhos](https://github.com/motajv/RoboTron_Joao_Victor_Compass/blob/main/Sprint%205%20%7C%206:%20Tech/Challenge/ServeRest%20Tester/tests/03_carrinhos_tests.robot):
  ```sh
  robot -d ./reports_carrinhos 03_carrinhos_tests.robot
  ```
- Execução de teste de carga em ambiente local:
  - Para teste de [carga](https://github.com/motajv/RoboTron_Joao_Victor_Compass/blob/main/Sprint%205%20%7C%206:%20Tech/Challenge/ServeRest%20Tester/support/python_func/python_func.robot):
  ```sh
    robot -d ./reports_carga python_func.robot
  ```
  - [Monitoramento de Status - ServeRest Local](http://localhost:3000/status)
  
## Resultado dos testes

- Acessar o arquivo *log.html* na pasta *report* referente ao teste executado.