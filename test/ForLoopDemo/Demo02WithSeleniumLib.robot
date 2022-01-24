*** Settings ***  
Library    Selenium2Library
Resource    ../../resources/rescources.robot

Test Setup    myTestSetup   ${BROWSER}    ${EXE_PATH}
Test Teardown    myTestTeardown

*** Variables ***
${URL}=    https://www.google.com/
${BROWSER}=   Chrome
${EXE_PATH}=   E:\\FSoft\\Selenium\\chromedriver_win32\\chromedriver.exe

*** Test Cases ***
TC to demonstrate FOR Loop in Robot Framework
    [Documentation]    TC to demonstrate FOR Loop in Robot Framework 
    
    ${pageTitle}=    Navigate To URL     ${URL}    
    
    Should Be Equal   '${pageTitle}'   'Google'
    Log    ${pageTitle}

    Input Text    name:q    Fresher Academy
    Press Keys    xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input   RETURN

    @{results_on_page}=    Get WebElements    xpath://*[@id="rso"]/div 

    :FOR    ${element}    IN   @{results_on_page}
    \        ${text}=    Get Text    ${element} 
     
 
