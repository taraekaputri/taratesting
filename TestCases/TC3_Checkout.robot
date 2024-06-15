*** Settings ***
Library     Selenium2Library
Library     OperatingSystem


*** Variables ***
${URL}          https://www.saucedemo.com/
${Browser}      Firefox
${DELAY}        5s


*** Keywords ***
Open Site
        Open Browser            ${URL}      ${Browser}
        Maximize Browser Window

Login   
         Sleep    ${DELAY}
         Selenium2Library.Click Element                         id=user-name
         Selenium2Library.Input Text                            id=user-name                 standard_user
         Selenium2Library.Input Text                            id=password                  secret_sauce
         Selenium2Library.Click Element                         id=login-button 
        Selenium2Library.Element Should be visible              class=inventory_item_label

Add cart
        Selenium2Library.Click Element                          id=add-to-cart-sauce-labs-backpack
        Sleep   ${DELAY}
        Selenium2Library.Element Should be visible              id=remove-sauce-labs-backpack
        Selenium2Library.Click Element                          xpath=//body/div[@id='root']/div[@id='page_wrapper']/div[@id='contents_wrapper']/div[@id='header_container']/div[1]/div[3]/a[1]

checkout
        Selenium2Library.Click Element                          id=checkout
        Selenium2Library.Input Text                             id=first-name                   TARA EKA
        Selenium2Library.Input Text                             id=last-name                    PUTRI
        Selenium2Library.Input Text                             id=postal-code                  16711
        Selenium2Library.Click Element                          id=continue
        Selenium2Library.Element Should be visible              xpath=//span[contains(text(),'Checkout: Overview')]
        Selenium2Library.Click button                           id=finish
        Selenium2Library.Element Should be visible              xpath=//h2[contains(text(),'Thank you for your order!')]



***Test Cases***
shopping cart checkout
    Open Site
    Login
    Add cart
    Checkout
