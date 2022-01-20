*** Settings ***
Resource    DefineKeywordsDemo.robot

*** Variables *** 
@{LIST}=    Husky    Corgi    Poodle

*** Test Cases ***
Run Keyword And Continue On Failure Demo
    Run Keyword And Continue On Failure    Fail    This is a stupid example
    Log    This keyword is executed
    
Runs the keyword and checks that the expected error occurred Demo
    Run Keyword And Expect Error     'If' is a reserved keyword.   CheckName 
    ${msg}=    Run Keyword And Expect Error    1 != 2    Should Be Equal    1    2
    Should Start With    ${msg}    1 != 2           

Run Keyword And Ignore Error Demo
    ${status}    ${value}=    Run Keyword And Ignore Error    CheckName        
    Run Keyword If    '${status}'=='FAIL'    Log    ok  
    
Run Keyword And Return Status Demo
    ${passed} =    Run Keyword And Return Status    CheckName2
    Run Keyword If    '${passed}'=='True'    Log    OK          
       
Return From Keyword Denmo
    ${index}=   Find Index    Husky    @{LIST}
    Should Be Equal    ${index}    ${0}    
    
    ${index}=    Find Index    non existing    @{LIST}
    Should Be True    ${index} == ${-1}   
