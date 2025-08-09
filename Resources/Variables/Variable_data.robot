*** Variables ***
${Browser}    gc
${URL}  https://the-internet.herokuapp.com/login
${Link_Logedin_page}    https://the-internet.herokuapp.com/secure
${Username}  tomsmith
${Password}  SuperSecretPassword!
${Message_success}    You logged into a secure area!
${Incorrect_P@ssword}    Password!
${Username_notfound}    tomholland
${Message_invalid}    Your password is invalid!
${Message_Username_invalid}    Your username is invalid!
@{LIST_A}    1    2    3    5    6    8    9
@{LIST_B}    3    2    1    5    6    0
${Endpoint}    https://reqres.in
${EXPECTED_ID}    12
${EXPECTED_EMAIL}    rachel.howell@reqres.in
${EXPECTED_FIRST_NAME}    Rachel
${EXPECTED_LAST_NAME}     Howell
${EXPECTED_AVATAR}        https://reqres.in/img/faces/12-image.jpg
${status_code_success}    200
${API_KEY_HEADER_NAME}    x-api-key
${API_KEY_HEADER_VALUE}    reqres-free-v1
${status_code_notfound}    404