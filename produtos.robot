*** Settings ***
Test Setup       Abrir navegador
Test Teardown    Fechar navegador
Resource         produtos.resource

*** Test Cases ***

TC01-Busca produtos masculinos
  [Tags]  tc01
    Dado que estou no site magento
    Quando acesso o menu Men
    Então deve ver a sessão masculina

TC02-acessar sessão de calças
  [Tags]  tc02
    Dado que estou no site magento
    Quando acesso o menu calças
    Então deve ver a sessão de calças

TC03-adicionar produto no carrinho, e tirar print
  [Tags]  tc03
    Dado que estou no site magento
    Quando acesso o produto mochila
    E adiciono ao carrinho
    Então devo ver o produto no carrinho