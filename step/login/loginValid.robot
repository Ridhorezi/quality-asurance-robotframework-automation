*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser       ${WebSauceDemo}    ${BROWSER}
Suite Teardown    Close Browser 

*** Variables ***
${WebSauceDemo}    https://saucedemo.com/
${BROWSER}         chrome

#Locators

${UsernameField}    //input[@id='user-name']
${PasswordField}    //input[@id='password']
${LoginButton}      //*[@id="login-button"]

*** Keywords ***
Input username
    Input Text    ${UsernameField}    standard_user

Input password
    Input Text    ${PasswordField}    secret_sauce

Click button login
    Click Element    ${LoginButton}
    Sleep            3s 

Verify on login page
    Page Should Contain    Sauce Labs Backpack

*** Test Cases ***
User login with valid data
    Input username
    Input password
    Click button login
    Verify on login page