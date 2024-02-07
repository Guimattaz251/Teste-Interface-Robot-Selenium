*** Settings ***
Resource            ../resource/Home/Resource_Home.robot
Resource            ../resource/My_Account/Resource_Account_Details.robot
Resource            ../resource/My_Account/Resource_Address.robot
Resource            ../resource/My_Account/Resource_Login.robot
Resource            ../resource/Navigation/Resource_Session.robot
Resource            ../resource/Product/Resource_Carrinho.robot
Resource            ../resource/Product/Resource_Checkout.robot
Resource            ../resource/Product/Resource_Product.robot

Suite Setup         Abrir navegador e fazer login    ${Login}    ${Password}    ${URL}    chrome
Suite Teardown      Fechar navegador e fazer logout    ${URL}    /my-account/


*** Variables ***
@{lista_produto}    Album    Beanie with logo


*** Test Cases ***
Cenário: Testar fluxo de compra
    # ADICIONANDO PRODUTOS
    Navegar para    url=${URL}    url_complementar=/

    Procurar produto    Album
    Selecionar produto    Album    2    15

    Procurar produto    Beanie with logo
    Selecionar produto    Beanie with logo    2    18

    # VALIDANDO PRODUTOS
    Navegar para    ${URL}    /cart
    Validar carrinho    Album    2    15
    Validar carrinho    Beanie with logo    2    18

    # CHECKOUT
    Navegar para    ${URL}    /checkout
    Realizar checkout    ${lista_produto}

    # LIMPAR CARRINHO
    Navegar para    ${URL}    /cart
    Limpar carrinho
