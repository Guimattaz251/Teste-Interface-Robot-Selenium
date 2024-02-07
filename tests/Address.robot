*** Settings ***
Resource            ../resource/Navigation/Resource_Session.robot
Resource            ../resource/My_Account/Resource_Login.robot
Resource            ../resource/My_Account/Resource_Account_Details.robot
Resource            ../resource/My_Account/Resource_Address.robot

Suite Setup         Abrir navegador e fazer login    ${Login}    ${Password}    ${URL}    chrome
Suite Teardown      Fechar navegador e fazer logout    ${URL}    /my-account/


*** Test Cases ***
Configurar endereço de entrega
    Navegar para    ${URL}    /my-account/edit-address/
    Alterar endereço de entrega
    ...    Bravos
    ...    Brazil
    ...    Rua dos governadores
    ...    Casa
    ...    São Paulo
    ...    São Paulo
    ...    12342351
    ...    1192934567
    Validar endereço de entrega
    ...    Bravos
    ...    Brazil
    ...    Rua dos governadores
    ...    Casa
    ...    São Paulo
    ...    São Paulo
    ...    12342351
    ...    11929934567
