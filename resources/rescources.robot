*** Settings ***
Library    Selenium2Library

*** Variables ***


*** Keywords ***
launchBrowserG
    [Arguments]    ${url}   ${browser}   ${exe_path}
    Create Webdriver   ${browser}    executable_path=${exe_path}
    Go To    ${url}
    
    Maximize Browser Window
    
    Run Keyword And Return     Get Title
launchBrowser
    [Arguments]    ${url}   ${browser}   ${exe_path}
    Create Webdriver   ${browser}    executable_path=${exe_path}
    Go To    ${url}
    
    Maximize Browser Window
    
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