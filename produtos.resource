*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}          https://magento.softwaretestingboard.com/
${menu_men}     xpath=//span[text()="Men"]
${submenu_bottoms}  xpath=//*[@id="ui-id-18"]/span[2]
${submenu_pants}    xpath=//*[@id="ui-id-23"]/span
${computadores_informatica}   Computadores e Informática | Amazon.com.br
${mochila}  css=a[title="Fusion Backpack"]
${btn_add_cart}  css=button[title="Add to Cart"]
${btn_my_cart}  css=a[class="action showcart"]

*** Keywords ***


Dado que estou no site magento
  Go To  ${url}
Quando acesso o menu Men
  Click Element  ${menu_men}
Então deve ver a sessão masculina
  Page Should Contain Element  xpath=//h1//span[text()="Men"]

Abrir navegador
  Open Browser  browser=chrome
  Maximize Browser Window

Fechar navegador
  Close Browser

Quando acesso o menu calças
  Set Selenium Speed  0.2
  Wait Until Element Is Enabled  ${menu_men}
  Mouse Over  ${menu_men}
  Wait Until Element Is Visible  ${submenu_bottoms}
  Mouse Over  ${submenu_bottoms}
  Wait Until Element Is Visible  ${submenu_pants}
  Click Element  ${submenu_pants}
  Set Selenium Speed  0

Então deve ver a sessão de calças
  Sleep  1s
  Title Should Be  Pants - Bottoms - Men Magento Commerce - website to practice selenium | demo website for automation testing | selenium practice sites

Quando acesso o produto mochila
  Wait Until Element Is Visible  ${mochila}
  Click Element  ${mochila}

E adiciono ao carrinho
  Wait Until Element Is Visible  xpath=//li//strong[text()="Fusion Backpack"]
  Title Should Be  Fusion Backpack Magento Commerce - website to practice selenium | demo website for automation testing | selenium practice sites
  Wait Until Element Is Visible  ${btn_add_cart}
  Click Element  ${btn_add_cart}

Então devo ver o produto no carrinho
  Sleep  2s
  Click Element  ${btn_my_cart}
  Wait Until Element Is Visible  xpath=//*[@id="mini-cart"]/li/div/div/strong/a
  Capture Page Screenshot
