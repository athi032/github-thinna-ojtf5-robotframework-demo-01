*** Settings ***
Library    Selenium2Library
Resource    ../../resources/rescources.robot

*** Variables ***
${URL}=    https://www.saucedemo.com/
${BROWSER}=    Chrome
${EXE_PATH}=   E:\\FSoft\\Selenium\\chromedriver_win32\\chromedriver.exe


*** Test Cases ***
LoginTest
    ${pageTitle}=    launchBrowser    ${URL}    ${BROWSER}    ${EXE_PATH}
    
    Should Be Equal   '${pageTitle}'   'Swag Labs'
    Log    ${pageTitle}     
    
    Input Text    id:user-name    standard_user
    Input Text    id:password    secret_sauce
    Click Button    id:login-button    
    
    ${items_on_page}=   Get Element Count    xpath://*[@class="inventory_list"]/div
    
    Run Keyword If    ${items_on_page} == 10    testCount1
    ...   ELSE IF    ${items_on_page} < 10    testCount2
    ...   ELSE   testCount3      
    
    
    
    