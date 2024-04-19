*** Settings ***
Library    ImapLibrary2
Library    String
Resource   ../Locators/lumate1Locator.robot

*** Keywords ***

Open PMS url on browser
    Open Browser    url=${PMS_URL}    browser=${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN_PAGE_PMS}    15s

Fill the credentials and login
    Input Text        ${USERNAME_PATH_PMS}    ${USERNAME_PMS}
    Input Text        ${PASSWORD_PATH_PMS}    ${PASSWORD_PMS}
    Click Element     ${REMEMBER_ME}
    Click Button      ${LOGIN_BTN}

Enetr OTP and Submit it
    ${otp}=  Wait for OTP email
    sleep    ${TIMEOUT}
    wait until element is enabled    ${OTP_PMS}    ${TIMEOUT}
    Input Text        ${OTP_PMS}    ${otp}[0]
    wait until element is enabled    ${OTP_PMS}    ${TIMEOUT}
    Input Text        ${OTP_PMS}    ${otp}[1]
    wait until element is enabled    ${OTP_PMS}    ${TIMEOUT}
    Input Text        ${OTP_PMS}    ${otp}[2]
    wait until element is enabled    ${OTP_PMS}    ${TIMEOUT}
    Input Text        ${OTP_PMS}    ${otp}[3]
    wait until element is enabled    ${OTP_PMS}    ${TIMEOUT}
    Input Text        ${OTP_PMS}    ${otp}[4]
    wait until element is enabled    ${OTP_PMS}    ${TIMEOUT}
    Input Text        ${OTP_PMS}    ${otp}[5]
    Click Button      ${VALIDATE_OTP}


Wait for OTP Email
    Open Mailbox    host=${EMAIL_SERVER}   user=${EMAIL_USERNAME}   password=${EMAIL_PASSWORD}
    ${email_index}=    Wait For Email   sender=${SENDER_USERNAME}  status=UNSEEN   timeout=300
    ${email_body}=      Get Email Body    ${email_index}
    ${otp}=    Get Regexp Matches    ${email_body}    \\b\\d{6}\\b
    Log               OTP received: ${otp}
    RETURN          ${otp}[3]


verify elements of TC-APP-002 visisble or not
    Element Should Be Visible   //*[@class="appointment-calendar h-100"]    Today
    Element Should Be Visible    ${CREATE_APPOINTMENT}
    Click Button    ${OPEN_RIGHTBAR_FOR_CALANEDER}
    Element Should Be Visible    ${Select_Office}    Select Office
    Element Should Be Visible    ${Select_Clinicians}    Select Clinicians

Creat Appointment and check elements
    Click Element     ${APPOINTMENT_SEC}
    Click Element     ${CREATE_APPOINTMENT}
    sleep    5s
    Element Should Contain    ${SCHEDULED_APPOINTMENT}    Schedule Appointment
    sleep    5s
    Element Should Be Visible    ${APPOINTMENT_TYPE}
    Element Should Be Visible    ${BACK_BUTTON}
