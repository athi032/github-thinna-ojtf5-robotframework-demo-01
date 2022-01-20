*** Settings ***  
Library    Selenium2Library
Resource    ../../resources/rescources.robot

*** Variables ***
${URL}=    https://www.google.com/
${BROWSER}=   Chrome
${EXE_PATH}=   E:\\FSoft\\Selenium\\chromedriver_win32\\chromedriver.exe

*** Test Cases ***
TC to demonstrate FOR Loop in Robot Framework
    [Documentation]    TC to demonstrate FOR Loop in Robot Framework
    Set Selenium Implicit Wait    5s
    
    ${pageTitle}=    launchBrowserG    ${URL}    ${BROWSER}    ${EXE_PATH}
    
    Should Be Equal   '${pageTitle}'   'Google'
    Log    ${pageTitle}

    Maximize Browser Window
    Input Text    name:q    Fresher Academy
    Press Keys    xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input   RETURN

    @{results_on_page}=    Get WebElements    xpath://*[@id="rso"]/div 

    :FOR    ${element}    IN   @{results_on_page}
    \        ${text}=    Get Text    ${element} 
     

    Close Browser
