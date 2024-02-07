*** Settings ***
Library     SeleniumLibrary
Resource    ../../data-driven/Credenciais.robot


*** Keywords ***
Quando eu realizo login
    [Arguments]    ${User}    ${Password}
    Wait Until Element Is Visible    id:username    10
    Input Text    id:username    ${User}
    Input Password    id:password    ${Password}

E verifico a validação
    Click Button    //*[@id="customer_login"]//button[@name="login"]

    Wait Until Page Contains    From your account dashboard you can view your

Quando realizo login incorreto
    [Arguments]    ${User}    ${Password}
    Input Text    id:username    ${User}
    Input Password    id:password    ${Password_incorreto}

Então aparece uma mensagem de erro
    Click Button    //*[@id="customer_login"]//button[@name="login"]
    Wait Until Element Is Visible    class:woocommerce-error
    Wait Until Element Contains    class:woocommerce-error    Error

Então faço logout
    Click Element
    ...    //*[@id="post-9"]//li[@class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--customer-logout"]/a
    Wait Until Element Is Visible    id:username
    Wait Until Element Is Visible    id:password