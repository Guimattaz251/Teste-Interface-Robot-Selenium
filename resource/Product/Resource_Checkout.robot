*** Settings ***
Library     SeleniumLibrary
Library     String


*** Keywords ***
Realizar Checkout
    [Arguments]    ${Produto}
    Wait Until Element Is Visible    class:entry-title

    FOR    ${i}    IN    @{Produto}
        Element Should Contain    //*[@id="order_review"]/table    ${i}
    END

    Wait Until Element Is Visible    //*[@id="place_order"]
    Mouse Over    //*[@id="place_order"]
    Click Element    //*{@id="place_order"}

    Sleep    5s
