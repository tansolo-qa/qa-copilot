*** Settings ***
Resource          ../../resources/config.robot

Test Setup        Open And Maximize Browser For SauceDemo
Test Teardown     Run Keywords    Capture Page On Failure    AND    Close Browser All

*** Test Cases ***
Open SauceDemo and Verify Landing Page
    [Documentation]    Test case to open SauceDemo website and verify the landing page elements.
    [Tags]    smoke
    # Browser is opened by Test Setup
    Wait Until Page Contains    Swag Labs    timeout=10s
    Page Should Contain Element    id=user-name
    Page Should Contain Element    id=password
    Page Should Contain Element    id=login-button
    # Browser is closed by Test Teardown

Login With Valid Credentials
    [Documentation]    Test case to log in with valid standard_user credentials.
    [Tags]    smoke    regression
    # Browser is opened by Test Setup
    Input Text    id=user-name    ${VALID_USERNAME}
    Input Text    id=password    ${VALID_PASSWORD}
    Click Button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
    Location Should Be    ${SAUCEDEMO_URL}/inventory.html
    Page Should Not Contain Element    ${LOGIN_ERROR_MESSAGE_XPATH}
    # Browser is closed by Test Teardown

Login With Invalid Credentials
    [Documentation]    Test case to attempt login with invalid credentials and verify error message.
    [Tags]    regression
    # Browser is opened by Test Setup
    Input Text    id=user-name    invalid_user
    Input Text    id=password    invalid_password
    Click Button    id=login-button
    Wait Until Page Contains Element    ${LOGIN_ERROR_MESSAGE_XPATH}    timeout=10s
    Element Text Should Be    ${LOGIN_ERROR_MESSAGE_XPATH}    Epic sadface: Username and password do not match any user in this service
    # Browser is closed by Test Teardown

Add Item To Cart
    [Documentation]    Test case to log in and add an item to the cart.
    [Tags]    regression
    # Browser is opened by Test Setup and is at SAUCEDEMO_URL (login page)
    Login To SauceDemo    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    xpath=//button[contains(@id,'add-to-cart')]    timeout=10s
    Click Button    xpath=//button[@id='add-to-cart-sauce-labs-backpack']
    Element Should Contain    class=shopping_cart_badge    1
    # Browser is closed by Test Teardown
