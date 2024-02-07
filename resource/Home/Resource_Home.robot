*** Settings ***
Library     SeleniumLibrary
Resource    ../Navigation/Resource_Session.robot
Resource    ../../data-driven/Credenciais.robot


*** Keywords ***
Procurar produto
    [Arguments]    ${Produto}
    Navegar para    ${URL}    /
    Input Text    id:woocommerce-product-search-field-0    ${Produto}
    Press Keys    id:woocommerce-product-search-field-0    ENTER
