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
Input invalid username
    Input Text    ${UsernameField}    wrong_user

Input invalid password
    Input Text    ${PasswordField}    wrong_password

Click button login
    Click Element    ${LoginButton}
    Sleep            3s 

Verify error message
    Page Should Contain    Username and password do not match any user in this service

*** Test Cases ***

User login with invalid data
    Input invalid username
    Input invalid password
    Click button login
    Verify error message