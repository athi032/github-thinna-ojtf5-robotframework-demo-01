*** Settings ***


*** Variables ***
${SCALAR_VAR}    Hello
@{LIST_VAR}    My    name    is    Thi   
&{DICT_VAR}    name=Thi    age=21


*** Test Cases ***
IfElseDemo1
    Log    ${SCALAR_VAR}  
    Log    @{LIST_VAR}[3]    
    Log    &{DICT_VAR}[age]    
    Log    This test was excuted by %{username} on %{os} 
    
    Run Keyword If    &{DICT_VAR}[age] >= 30    Log    Good job!
    ...  ELSE IF   30 > &{DICT_VAR}[age] > 18   Log    Well done!    
    ...    ELSE    Log    Great!    
    ...    
    Run Keyword Unless    &{DICT_VAR}[age] > 30    Log  What's your major?
     
