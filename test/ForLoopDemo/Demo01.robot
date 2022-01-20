*** Test Cases ***
ForLoop1
    :FOR   ${i}   IN RANGE   1   10
    \    Log To Console    ${i}    
 
    
ForLoop2
    :FOR    ${i}    IN   1   2   3   4   5
    \    Log To Console    ${i}    
    

ForLoop3WithList
    @{items}    Create List    1  2  3  
    :FOR    ${i}    IN  @{items}
    \    Log To Console    ${i}    
    
ForLoop4
    :FOR   ${i}  IN  john   david  smith   scott
    \    Log To Console    ${i} 
    \    Run Keyword If    '${i}'=='david'    Continue For Loop  
    \    Log    ${i}    
    
ForLoop5
    @{nameslist}  Create List    john   david  smith   scott  
    :FOR   ${i}  IN  @{nameslist}
    \    Log To Console    ${i}    
    \    Continue For Loop If    '${i}'=='john'
    \    Log    ${i}

Forloop6withExit
    @{items}    Create List    1    2    3    4    5
    :FOR    ${i}    IN    @{items}
    \    Log To Console    ${i}    
    \    Exit For Loop If    ${i}==3   