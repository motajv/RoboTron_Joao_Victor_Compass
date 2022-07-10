*** Settings ***
Documentation                   Keywords e Variables para Geração de Dados
Library     FakerLibrary  locale=pt_br
Library     String
Library     JSONLibrary

*** Variables ***
@{produto}      Televisão    Computador    Monitor    Memória    Mouse    Gabinete     Teclado    Notebook   
@{marca}        Samsung      Philco        LG         Dell       Sony     Acer         HP         Asus
${descricao}    Eletroeletrônico
${id_produto}   BeeJh5lz3k6kSIzA

*** Keywords ***
Criar Dados Produto Valido
    ${produto}=         Evaluate    random.choice(@{produto}) + " " + random.choice(@{marca})   random
    ${codigo}           FakerLibrary.RandomNumber   digits=5    
    ${nome}             Catenate    ${produto} ${codigo}    
    ${preco}            FakerLibrary.RandomNumber   digits=3     
    ${quantidade}       FakerLibrary.RandomNumber   digits=3
    &{payload}               Create Dictionary       nome=${nome}        preco=${preco}         descricao=${descricao}      quantidade=${quantidade}
    Log To Console  ${payload}
    Set Global Variable        ${payload}