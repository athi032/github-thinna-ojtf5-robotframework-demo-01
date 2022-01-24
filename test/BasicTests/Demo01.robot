*** Settings ***
Library    Selenium2Library
Resource    ../../resources/rescources.robot

Suite Setup    Log    This is Test Suite Setup    
Suite Teardown    Log    This is Test Suite Teardown    

Test Setup    myTestSetup   ${BROWSER}    ${EXE_PATH}
Test Teardown    myTestTeardown 

Default Tags    tag01
Force Tags    tag02

*** Variables *** 
 

*** Test Cases ***
TestUploadfile
    [Tags]    uploadFile
    ${url}=    Set Variable     https://www.w3schools.com/howto/howto_html_file_upload_button.asp
    
    ${pageTitle}=    Navigate To URL    ${url}  
    
    Should Contain    ${pageTitle}    File Upload
    
    
    Press Key   ${ID_MY_FILE}     C:\\Users\\OneDrive\\Pictures\\blue ocean waves.jpeg  
    
    ${fileName}=    Get Value    ${ID_MY_FILE}
    
    Should Contain    ${fileName}    blue ocean waves.jpeg    
 
    
Test Iframe
    ${url}=    Set Variable     https://www.w3schools.com/html/html_iframe.asp
    
    ${pageTitle}=    Navigate To URL    ${url}    
    
    Should Contain    ${pageTitle}    Iframe    
    
    #check title in main page
    ${h1Element}=    Get Text    css:#main > h1 
    Should Be Equal    ${h1Element}    HTML Iframes    
    
    Select Frame    //*[@id="main"]/div[3]/iframe    
    #check title in iframe
    ${h1Element}=    Get Text    css:#main > h1 
    Should Be Equal    ${h1Element}   HTML Tutorial
    
    Click Element    css:#topnav > div > div > a:nth-child(5)  
    
    #check title after click in iframe
    ${h1Element}=    Get Text    css:#main > h1 
    Should Be Equal    ${h1Element}   JavaScript Tutorial
    
    Select Window    MAIN   
    
    #check title in main page
    ${h1Element}=    Get Text    css:#main > h1 
    Should Be Equal    ${h1Element}    HTML Iframes    
     
 

Test New Tab 
    ${url}=    Set Variable     http://www.google.com/
    
    ${pageTitle}=    Navigate To URL    ${url}    
    
    Title Should Be    ${pageTitle}   
    
    Execute Javascript    window.open('')
    Get Window Titles
    Select Window    title=undefined
    
    ${pageTitle}=   Navigate To URL    http://www.youtube.com/    
    Should Be Equal    ${pageTitle}   YouTube
     
    Select Window    MAIN
    Title Should Be    Google    
    

Test Popout Windows 
    ${url}=    Set Variable     https://www.encodedna.com/javascript/demo/open-new-window-using-javascript-method.htm
    
    ${pageTitle}=    Navigate To URL    ${url}        
    Should Contain    ${pageTitle}   Open a New Browser Window
    
    Execute Javascript    window.scrollTo(0, 500)
    
    Click Element    //*[@id="content"]/div[3]/p[2]/input[1]    
    
    @{windowHandle}=    Get Window Handles
    
    Select Window    @{windowHandle}[1]
    ${page2Title}=    Get Title
    Should Contain    ${page2Title}    Open a New Window using JavaScript    
    
    Select Window    @{windowHandle}[0]
    ${pageTitle}=    Get Title
    Should Contain    ${pageTitle}    Open a New Browser Window    
    
    
