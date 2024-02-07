*** Settings ***
Library     SeleniumLibrary
Resource    ../Navigation/Resource_Session.robot
Resource    ../../data-driven/Credenciais.robot


*** Keywords ***
Selecionar produto
    [Arguments]    ${Produto}    ${Quantidade}    ${Valor}

    ${Produto_get}    Get WebElement    //*[@class="product_title entry-title"]
    Should Contain    ${Produto_get.text}    ${Produto}

    Input Text    //*[@class="input-text qty text"]    ${Quantidade}
    Click Element    //*[@class="single_add_to_cart_button button alt"]

    Wait Until Element Is Visible    class:woocommerce-message
    ${message_get}    Get WebElement    class:woocommerce-message
    Should Contain Any    ${message_get.text}    has been added to your cart    have been added to your cart
