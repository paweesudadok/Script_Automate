*** Settings ***
Documentation        Login function
Library    RequestsLibrary
Test Teardown    Close All Browsers

Resource    ${CURDIR}/../Resources/Variables/Variable_data.robot
Resource    ${CURDIR}/../Resources/Keyword/Login_Keyword.robot
Resource    ${CURDIR}/../Resources/Repository/Login_repo.robot

*** Test Cases ***
TC01_001 compound List
    [Tags]  List
    [Documentation]
     ...    DESCRIPTION:
     ...    Check duplicate items from list A and list B and append to a new list. Using your
     ...     preferred programming language.
     ...    
    ${AUB}=    Create List    @{LIST_A}    @{LIST_B}
    Log    ${AUB}

TC02_001 Login success
    [Tags]   Login success   
    [Documentation]
     ...    DESCRIPTION:
     ...    To verify that users can login successfully when input a correct username and password.
     ...    Test Step
     ...    "1. Open browser and go to'http://the-internet.herokuapp.com/login'.
     ...    2. Input username'tomsmith' and password'SuperSecretPassword!'.
     ...    3. Click the 'Logout' button.
     ...    Expected Result
     ...    1. Login page is shown.
     ...    2. Login success and message 'You logged into asecure area!' is shown.
     ...    3. Go back to the Loginpage and the message ' Youlogged out of the securearea!' is shown.

    open website:  ${Browser}    ${URL} 
    Fill out Input:    ${Input_Username}   ${Username}
    Fill out Input:    ${Input_Password}    ${Password}
    Click Element:    ${button_login}
    #Handle Alert    ACCEPT  10s
    #Verify Link:    ${Link_Logedin_page}  
    Verify message:    ${Div_Login_success}   ${Message_success}  

TC02_002 Login failed-Password incorrect
    [Tags]   Login failed 
    [Documentation]
     ...    DESCRIPTION:
     ...    To verify that users can login unsuccessfully when they input a correct username but
     ...    wrong password. 
     ...    Test Step
     ...    "1. Open browser and go to'http://the-internet.herokuapp.com/login'.
     ...    2. Input username'tomsmith' and password'Password!'.
     ...    Expected Result
     ...    1. Login page is shown.
     ...    2. Login failed and the message 'Your password is invalid!' is shown.
    open website:  ${Browser}    ${URL} 
    Fill out Input:    ${Input_Username}   ${Username}
    Fill out Input:    ${Input_Password}    ${Incorrect_P@ssword}
    Click Element:    ${button_login}    
    Verify message:    ${Error_Message_login}  ${Message_invalid}

TC02_003 Login failed - Username notfound
    [Tags]  Login failed
    [Documentation]
     ...    To verify that users can login unsuccessfully when they input a username that did not exist.
     ...    Test Step
     ...    1. Open browser and go to'http://the-internet.herokuapp.com/login'.
     ...    2. Input username'tomholland' and password 'Password!'.
     ...    Expected Result
     ...    1. Login page is shown.
     ...    2. Login failed and the message 'Your username is invalid!' is shown.
    open website:  ${Browser}    ${URL} 
    Fill out Input:    ${Input_Username}   ${Username_notfound}
    Fill out Input:    ${Input_Password}    ${Incorrect_P@ssword}
    Click Element:    ${button_login}    
    Verify message:    ${Error_Message_login}  ${Message_Username_invalid}

TC03_001 Get user profile success
    [Tags]    Test API
    [Documentation]
     ...    To verify get user profile api will return correct data when trying to get profile of existing user
     ...    Test Step
     ...    1. Send Get request to url https://reqres.in/api/users/12
     ...    Expected Result
     ...    1. Verify response status code should be ‘200’
     ...    2. Compare the response body with expected below.
     ...    ‘ID’ == 12
     ...    ‘Email’ == rachel.howell@reqres.in
     ...    ‘First Name’ == Rachel
     ...    ‘Last Name’ == Howell
     ...    ‘Avatar’ ==https://reqres.in/img/faces/12-image.jpg
     ...    
    Create Session  ProfileAPI    ${Endpoint}
    ${send_Request}    GET      ProfileAPI     ${Endpoint}/api/users/12    expected_status=200
    #Should Be Equal As Strings    ${response.status_code}    200

    ${json}=    To Json    ${response.content}
    ${data}=    Get From Dictionary    ${json}    data

    Should Be Equal    ${data['id']}           ${EXPECTED_ID}
    Should Be Equal    ${data['email']}        ${EXPECTED_EMAIL}
    Should Be Equal    ${data['first_name']}   ${EXPECTED_FIRST_NAME}
    Should Be Equal    ${data['last_name']}    ${EXPECTED_LAST_NAME}
    Should Be Equal    ${data['avatar']}       ${EXPECTED_AVATAR}

TC03_002 Get user profile but user not found
    [Tags]    Test API
    [Documentation]
     ...    To verify get user profile api will return 404 not found when trying to get exist profile of not existing user
     ...    Test Step
     ...    1. Send Get request to url https://reqres.in/api/users/1234
     ...    Expected Result
     ...    1. Verify response status code should be ‘404’
     ...    2.  Response body should be '{}'
    Create Session  ProfileAPI    ${Endpoint}
    ${send_Request}    GET      ProfileAPI     /api/users/1234    expected_status=404
    #Should Be Equal As Strings    ${response.status_code}    200

    ${json}=    To Json    ${response.content}
    ${data}=    Get From Dictionary    ${json}    data