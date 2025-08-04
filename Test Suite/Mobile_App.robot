*** Settings ***
Library    AppiumLibrary
Library    Collections

Resource    ${CURDIR}/../Resource/Repository/Repository_Appium.robot
Resource    ${CURDIR}/../Resource/Variables/Variable_Appium.robot
Resource    ${CURDIR}/../Resource/Keyword/Keyword_Appium.robot

*** Test Case ***
Input Data
    Connect Application:     ${APPIUM_SERVER_URL}     ${PLATFORM_NAME}   ${PLATFORM_VERSION}      

