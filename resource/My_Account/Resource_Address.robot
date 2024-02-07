*** Settings ***
Library     SeleniumLibrary
Resource    ../My_Account/Resource_Account_Details.robot
Resource    ../My_Account/Resource_Login.robot
Resource    ../../data-driven/Credenciais.robot


*** Keywords ***
Alterar endereço de entrega
    [Arguments]    ${Company}    ${Country}    ${Street}    ${House}    ${City}    ${State}    ${Zip_Code}    ${Phone}
    Click Element    (//*[@id="post-9"]//a[@class="edit"])[1]
    Wait Until Element Is Visible    id:billing_company
    Input Text    id:billing_company    ${Company}
    Select From List By Label    id:billing_country    ${Country}
    Input Text    id:billing_address_1    ${Street}
    Input Text    id:billing_address_2    ${House}
    Input Text    id:billing_city    ${House}
    Select From List By Label    id:billing_state    ${State}
    Input Text    id:billing_postcode    ${Zip_Code}
    Input Text    id:billing_phone    ${Phone}
    Click Button    //*[@id="post-9"]//button[@class="button"]

Validar endereço de entrega
    [Arguments]    ${Company}    ${Country}    ${Street}    ${House}    ${City}    ${State}    ${Zip_Code}    ${Phone}
    Wait Until Element Is Visible    class:woocommerce-MyAccount-content

    ${texto}=    Get WebElement    class:woocommerce-MyAccount-content

    @{lista_opcoes}=    Create List
    ...    ${Company}
    ...    ${Country}
    ...    ${Street}
    ...    ${House}
    ...    ${City}
    ...    ${State}
    ...    ${Zip_Code}
    ...    ${Phone}
    Should Contain Any    ${texto.text}    @{lista_opcoes}
