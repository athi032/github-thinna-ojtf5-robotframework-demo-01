*** Settings ***
Documentation    'Call method' keyword demo program
Variables    Calculator.py


*** Variables ***


*** Test Cases ***
Basic Calculator
    ${addittion}=    Call Method    ${cal}   add   20   30
    Should Be Equal As Numbers    ${addittion}    50    
    
    ${is_contain_apple}=    Call Method   ${cal}    kwargs_demo_1   orange  mango  Apple  Kiwi
    Should Be True    ${is_contain_apple}==True     
    
    ${is_contain_mango}=    Call Method   ${cal}    kwargs_demo_2    name=abc   salary=1000   fruit=mango
    Should Be True    ${is_contain_mango}==True    
    

CatenateKeywordDemo
    ${str1}=    Catenate    Hello   Thi
    ${str2}=    Catenate   SEPARATOR=--    Hello   Anh   Thi
    Log    ${str1}    
    Log    ${str2}
    

CommentKeywordDemo
    Comment    this is message
    Log    this is other message        