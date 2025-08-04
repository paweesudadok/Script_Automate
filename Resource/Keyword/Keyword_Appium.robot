*** Settings ***
Library    AppiumLibrary
Library    Collections

Resource    ${CURDIR}/../Repository/Repository_Appium.robot
Resource    ${CURDIR}/../Variables/Variable_Appium.robot

*** Keyword ***
Connect Application:
    [Arguments]    ${remoteUrl}    ${platformName}    ${platformVersion}    ${udid}    ${virtual_device_name}           
    Log    In Open App
    ${devices}    Aisappium Open Application    http://${remoteUrl}/wd/hub    alias=NewEasyApp    platformName=${platformName}    platformVersion=${platformVersion}    udid=${udid}
    ...    appPackage=${andriod_package}     appActivity=com.nextzy.easyapp.android.ui.splashScreen.SplashScreenActivity    deviceName=${remoteUrl}    unicodeKeyboard=${false}    resetKeyboard=${True}    noReset=${True}
    ...    automationName=uiautomator2        autoWebview=true
    # chromedriverExecutable=${chromedriver}
    # chromedriver_cdnurl=http://npm.taobao.org/mirrors/chromedriver
    Log    Out Open App
    