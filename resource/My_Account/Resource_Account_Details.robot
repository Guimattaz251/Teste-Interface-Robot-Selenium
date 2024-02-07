*** Settings ***
Library     SeleniumLibrary
Resource    ../../data-driven/Credenciais.robot
Resource    ../Navigation/Resource_Session.robot


*** Keywords ***
Quando eu altero detalhes da conta
    [Arguments]    ${Nome}    ${Last_name}    ${Display_name}
    Input Text    id:account_first_name    ${Nome}
    Input Text    id:account_last_name    ${Last_name}
    Input Text    id:account_display_name    ${Display_name}
    Click Button    //*[@id="post-9"]//button[@class="woocommerce-Button button"]

Então valido detalhes da conta no dashboard
    [Arguments]    ${Display_name}

    Dado que eu navego para    ${URL}    /my-account/

    Wait Until Element Is Visible    class:woocommerce-MyAccount-content

    ${texto_dashboard}=    Get WebElement    class:woocommerce-MyAccount-content
    Log To Console    ${texto_dashboard}
    Log To Console    ${texto_dashboard.text}

    Should Contain    ${texto_dashboard.text}    ${Display_name}

Então valido o erro ao configurar detalhes da conta
    Wait Until Element Is Visible    class:woocommerce-error

    ${texto_erro}=    Get WebElement    class:woocommerce-error
    Log To Console    ${texto_erro.text}

    @{lista_opcoes}=    Create List
    ...    First name is a required field
    ...    Last name is a required field
    ...    Display name is a required field
    Should Contain Any    ${texto_erro.text}    @{lista_opcoes}
