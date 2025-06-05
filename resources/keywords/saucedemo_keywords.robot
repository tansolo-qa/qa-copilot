*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SAUCEDEMO_URL}    https://www.saucedemo.com
${BROWSER}          chrome

*** Keywords ***
Open And Maximize Browser For SauceDemo
    Open Browser    ${SAUCEDEMO_URL}    ${BROWSER}
    Maximize Browser Window

Close Browser All
    Close All Browsers