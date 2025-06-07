*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem  # For Create Directory, Join Path and other OS operations
Library    String

*** Variables ***
${SAUCEDEMO_URL}    https://www.saucedemo.com
${BROWSER}          chrome

*** Keywords ***
Login To SauceDemo
    [Documentation]    Performs login actions. Assumes browser is already open at the login page.
    [Arguments]    ${username}    ${password}
    Wait Until Page Contains Element    id=user-name    timeout=10s    error=Login page did not load correctly.
    Input Text    id=user-name    ${username}
    Input Text    id=password    ${password}
    Click Button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s

Capture Page On Failure
    [Documentation]    Captures a screenshot if the current test case fails.
    ...    Saves screenshot to: ${OUTPUT_DIR}/screenshots/${SUITE_NAME}/${TEST_NAME}_failure.png
    ...    This keyword relies on Robot Framework's automatic variables:
    ...    `${TEST_STATUS}`, `${SUITE_NAME}`, `${TEST_NAME}`, and `${OUTPUT_DIR}`.
    IF    '${TEST_STATUS}' == 'FAIL'
        ${safe_suite_name} =    Replace String    ${SUITE_NAME}    ${SPACE}    _
        ${safe_test_name} =    Replace String    ${TEST_NAME}    ${SPACE}    _
        ${screenshot_suite_dir} =    Join Path    ${OUTPUT_DIR}    screenshots    ${safe_suite_name}
        Create Directory    ${screenshot_suite_dir}
        ${screenshot_filename} =    Catenate    SEPARATOR=    ${safe_test_name}_failure.png
        ${full_path} =    Join Path    ${screenshot_suite_dir}    ${screenshot_filename}
        Capture Page Screenshot    filename=${full_path}
        Log    Screenshot saved to ${full_path}    WARN
    END

Capture Page Per Test Case
    [Documentation]    Captures a screenshot for each test case, organizing by file and test case name.
    [Arguments]    ${test_status}    ${test_name}    ${file_name}
    Run Keyword If    '${test_status}' == 'FAIL'    Create Directory    results/screenshots/${file_name}
    Run Keyword If    '${test_status}' == 'FAIL'    Capture Page Screenshot    results/screenshots/${file_name}/${test_name}_failure.png

Open Google in Chrome
    [Documentation]    Opens Google in Chrome and maximizes the browser window.
    Open Browser    https://www.google.com    chrome
    Maximize Browser Window
    Wait Until Page Contains    Google