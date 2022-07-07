# Sessão para configuração, documentação, imports de arquivos e library's
* Settings *
Documentation       Arquivo simples para requisição HTTP em APIs Resposta
Library             RequestsLibrary
Library             FakerLibrary
Library             Collections
Library             OperatingSystem
Library	            JSONLibrary
Resource            ./common/common.robot
Resource            ./fixtures/dynamic/dynamics.robot
Resource            ./variables/variables.robot







# Sessão para criação de Keywords Personalizadas
* Keywords *
Criar Sessao
    Create Session          serverest           ${BASE_URI}


