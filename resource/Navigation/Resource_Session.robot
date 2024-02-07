*** Settings ***
Library     SeleniumLibrary
Resource    ../../data-driven/Credenciais.robot
Resource    ../My_Account/Resource_Login.robot


*** Keywords ***
Navegar para
    [Arguments]    ${url}    ${url_complementar}
    Go To    ${url}${url_complementar}

Abrir navegador
    [Arguments]    ${URL}    ${browser}=chrome
    Open Browser
    ...    url=${URL}
    ...    browser=${browser}
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window

Abrir navegador e fazer login
    [Arguments]    ${User}    ${Password}    ${URL}    ${browser}
    Abrir navegador    ${URL}    ${browser}
    Navegar para    ${URL}    /my-account/
    Realizar login    ${User}    ${Password}

Fechar navegador
    Close Browser

Fechar navegador e fazer logout
    [Arguments]    ${URL}    ${Url_complementar}
    Navegar para    ${URL}    ${Url_complementar}
    Realizar logout
    Fechar navegador
