*** Settings ***
Resource    ../Resources/Library_resource.resource


*** Variable ***

*** Keywords ***
Login to Middle Riddle 
    [Arguments]    ${username}    ${password}
    Open Browser    ${url}    chrome
    Maximize Browser Window 
    Input Text    //input[@name='username']    ${username}
    Input Password    //input[@name ='password']    ${password}
    Click Button    //button[contains(text(),'เข้าสู่ระบบ')]

 
