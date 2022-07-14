*** Settings ***
Documentation                   Keywords para Geração de Dados
Library                         FakerLibrary    locale=pt_br

*** Keywords ***
Criar Dados Usuario Valido
    ${nome}         FakerLibrary.Name
    ${email}        FakerLibrary.Email
    ${senha}        FakerLibrary.Password     length=10     special_chars=False
    ${payload}      Create Dictionary       nome=${nome}           email=${email}           password=${senha}          administrador=false
    Log To Console  ${payload}
    Set Global Variable        ${payload}

Criar Dados Usuario Valido Administrador
    ${nome}         FakerLibrary.Name
    ${email}        FakerLibrary.Email
    ${senha}        FakerLibrary.Password     length=10     special_chars=False
    ${payload}      Create Dictionary       nome=${nome}           email=${email}           password=${senha}          administrador=true
    Log To Console  ${payload}
    Set Global Variable        ${payload}
