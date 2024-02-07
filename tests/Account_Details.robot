*** Settings ***
Resource            ../resource/My_Account/Resource_Login.robot
Resource            ../resource/Navigation/Resource_Session.robot
Resource            ../data-driven/Credenciais.robot
Resource            ../resource/My_Account/Resource_Account_Details.robot

Suite Setup         Abrir navegador e fazer login    ${Login}    ${Password}    ${URL}    chrome
Suite Teardown      Fechar navegador e fazer logout    ${URL}    /my-account/


*** Test Cases ***
Cenário: Configurar detalhes da conta de forma correta
    Dado que eu navego para    ${URL}    /my-account/edit-account/
    Quando eu altero detalhes da conta    Guilherme    Matta    Testador Nato
    Então valido detalhes da conta no dashboard    Testador Nato

Cenário: Configurar incorretamente os detalhes da conta
    Dado que eu navego para    ${URL}    /my-account/edit-account/
    Quando eu altero detalhes da conta    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Então valido o erro ao configurar detalhes da conta
