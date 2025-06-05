*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Open Google in Chrome
    Open Browser    https://www.google.com    chrome
    Maximize Browser Window
    Wait Until Page Contains    Google
