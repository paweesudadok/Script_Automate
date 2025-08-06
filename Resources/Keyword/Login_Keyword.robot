*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     JSONLibrary
Library     requests
Library     String
Library     Collections
Library     OperatingSystem
Library     DateTime
Resource   ${CURDIR}/../Repository/Login_repo.robot
Resource    ${CURDIR}/../Variables/Variable_data.robot
*** Keywords ***
#options=add_argument("--incognito") ---> ไม่ให้ alert แสดง
open website:
    [Arguments]    ${Browser}    ${URL}
    Open Browser    ${URL}    ${Browser}     options=add_argument("--incognito")   
    Maximize Browser Window
Fill out Input:
    [Arguments]    ${Locator}    ${Data}
    Wait Until Element Is Visible    ${Input_Username}    120s
    Input Text    ${Locator}    ${Data}
Click Element:
    [Arguments]    ${Locator}
    Wait Until Element Is Visible    ${Locator}    120s
    Click Element    ${Locator}

Verify message:
    [Arguments]    ${Locator}    ${Expected_Message}
    Wait Until Element Is Visible    ${Locator}    120s
    ${Message}    Get Text    ${Locator}
    Element Text Should Be    ${Locator}    ${Message}    ${Expected_Message}   ignore_case=${False}
    
Verify Link:
    [Arguments]    ${Link}
    Wait Until Location Contains    e${Link}    120s
    Location Should Be    ${Link}

 