*** Settings ***
Library    Selenium2Library

*** Variables ***
${BROWSER}=   Chrome
${EXE_PATH}=   E:\\FSoft\\Selenium\\chromedriver_win32\\chromedriver.exe
${ID_MY_FILE}=   id:myFile

*** Keywords *** 
myTestSetup
    Log    This is Test Setup
    
    
    [Arguments]    ${browser}   ${exe_path}   
    Create Webdriver   ${browser}    executable_path=${exe_path}
    Set Browser Implicit Wait    5s
    Maximize Browser Window      
       
    
myTestTeardown
    Log    This is Test Teardown
    Run Keyword If Test Failed    Capture Page Screenshot        
    Close Browser

Navigate To URL
    [Arguments]    ${url}
    
    Go To    ${url} 
    
    Run Keyword And Return     Get Title
    
testCount1
    Log To Console    Found items as expected items   
    Close Browser
      
testCount2
    Log To Console    Found items less than expected items    
    Close Browser
    
testCount3
    Log To Console    Exception    
    Close Browser