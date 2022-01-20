*** Settings ***


*** Variables ***
${NAME}=    Anh Thi 

*** Keywords ***
CheckName
    IF    ${NAME} == 'Thi'
        Log    Right person.
    ELSE    Log    Deny!
    
CheckName2
    Should Be Equal As Strings    ${NAME}    Anh Thi    
    
Find Index
    [Arguments]    ${element}    @{items}
    ${index}=    Set Variable    ${0}
    :FOR    ${item}    IN       @{items}
    \    Run Keyword If    '${item}'== '${element}'   Return From Keyword  ${index}   
    \    ${index}=    Set Variable    ${index+1}
    Return From Keyword    ${-1}    
 
        
    