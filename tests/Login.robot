*** Settings ***
Resource            ../resource/My_Account/Resource_Login.robot
Resource            ../resource/Navigation/Resource_Session.robot
Resource            ../data-driven/Credenciais.robot

Suite Setup         Abrir navegador    URL=${URL}
Suite Teardown      Fechar navegador
Test Setup          Navegar para    ${URL}    /my-account/


*** Test Cases ***
Cenário: login com sucesso
    Realizar login    ${Login}    ${Password}
    Sleep    5s
    Realizar logout

Cenário: Login sem sucesso
    Realizar login incorreto    ${Login}    ${Password_incorreto}
