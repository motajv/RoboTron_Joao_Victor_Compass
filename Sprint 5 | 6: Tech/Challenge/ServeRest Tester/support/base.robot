# Sessão para configuração, documentação, imports de arquivos e library's
*** Settings ***
Documentation       Arquivo simples para requisição HTTP em APIs Resposta
Library             RequestsLibrary
Library             FakerLibrary
Library             Collections
Library             OperatingSystem
Library	            JSONLibrary
Resource            ./common/common.robot
Resource            ./fixtures/dynamic/00_usuarios_dynamics.robot
Resource            ./fixtures/dynamic/01_produtos_dynamics.robot
Resource            ./variables/variables.robot
Resource            ../keywords/00_login_keywords.robot
Resource            ../keywords/02_produtos_keywords.robot











