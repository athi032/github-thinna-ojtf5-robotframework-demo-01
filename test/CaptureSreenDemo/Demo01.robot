*** Settings ***
Library    Selenium2Library
Resource    ../../resources/rescources.robot

Test Setup    myTestSetup    ${BROWSER}    ${EXE_PATH}
Test Teardown    myTestTeardown

*** Variables ***
${URL}=    https://mail.google.com/

*** Test Cases ***
CaptureSreen1
    ${page_title}=    Navigate To URL    ${URL}
    
    Input Text    id:identifierId    blue0703t@gmail.com
    Click Element    //*[@id="identifierNext"]/div/button/span   
    
    Wait Until Page Contains Element    xpath://*[@id="password"]/div[1]/div/div[1]/input    
    Input Text    xpath://*[@id="password"]/div[1]/div/div[1]/input    blue0703t@gmail.com
    ${status}=    Run Keyword And Return Status   Click Element  //*[@id="passwordNext"]/div/button/span
    
    Run Keyword If    not ${status}    Capture Page Screenshot            
