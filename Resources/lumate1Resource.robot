*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    ImapLibrary2
Library    String
Library    OperatingSystem
Library    pyperclip
Library    Collections
Library    ../PythonLib/copy-paste.py    WITH NAME    CustomKeywords
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

Enter OTP and Submit it
    ${otp}=  Wait for OTP email
    CustomKeywords.Copy To Clipboard    ${otp}
    sleep    5s
    Click Element    ${OTP_CLICK}
    wait until element is enabled    ${OTP_PMS}    ${TIMEOUT}
    Press Keys    ${OTP_PMS}    CTRL+V
    Click Button      ${VALIDATE_OTP}
    sleep    10s


Wait for OTP Email
    Open Mailbox    host=${EMAIL_SERVER}   user=${EMAIL_USERNAME}   password=${EMAIL_PASSWORD}
    ${email_index}=    Wait For Email   sender=${SENDER_USERNAME}  status=UNSEEN   timeout=300
    ${email_body}=      Get Email Body    ${email_index}
    ${otp}=    Get Regexp Matches    ${email_body}    \\b\\d{6}\\b
    Delete Email    ${email_index}
    Log               OTP received: ${otp}
    RETURN          ${otp}[3]

#
#    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
#    ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=300
#    ${HTML} =    Get Email Body    ${LATEST}
#    ${otpText}    Get Regexp Matches    ${HTML}    \\d{${OtpLength}}
#    Delete Email         ${LATEST}
#    Web.Wait Until Element Is Visible    ${OtpTextBox}    ${StandardTimeout}
#    Web.Input Text       ${OtpTextBox}    ${otpText}[0]
#    Web.Click Element    ${VerifyOtpButton}
#    Select the Checkbox if Terms of Use Page is visible




Wait Until the Update Icon Disappear
    sleep  100ms
    Wait Until Element Is Not Visible  ${UpdateIcon}    ${Timeout}


verify elements of TC-APP-002 visible or not
    Element Should Be Visible   //*[@class="appointment-calendar h-100"]    Today
    Element Should Be Visible    ${CREATE_APPOINTMENT}
    Click Button    ${OPEN_RIGHTBAR_FOR_CALANEDER}
    Element Should Be Visible    ${Select_Office}    Select Office
    Sleep    5s
    Element Should Be Visible    ${Select_Clinicians}    Select Clinicians

Create Appointment and check elements
    Click Element     ${APPOINTMENT_SEC}
    Click Element     ${CREATE_APPOINTMENT}
    sleep    5s
    Element Should Contain    ${SCHEDULED_APPOINTMENT}    Schedule Appointment
    sleep    5s
    Element Should Be Visible    ${APPOINTMENT_TYPE}
    Element Should Be Visible    ${BACK_BUTTON}

Patient View Details Screen
    Click Element    ${PATIENT_SEC}
    Sleep    5s
    Click Element    ${VIEW_PATIENT1}
    Sleep    5s
    Element Should Be Visible    ${PATIENT_DETAIL}

Patient Edit Details Screen
    Click Element    ${PATIENT_SEC}
    Sleep    5s
    Click Element    ${EDIT_PATIENT1}
    Sleep    5s

Changing status of billing to ready to bill
    Click Element    ${UNBILLED_STATUS}
    Sleep    3s
    ${COUNT}=    Get Element Count    ${DETAILED_STATUS}
#    Run Keyword If    ${COUNT} > 0
#    ...    Run Keywords
#    ...    Click Element        ${BILLING_STATUS}
#    ...    Click Element        ${READY_TO_BILL}
#    ...    Click Element        ${YES_FOR_STATUS_CHANGE}
    FOR     ${i}  IN RANGE      ${COUNT}
        Click Element    ${BILLING_STATUS}
        Click Element    ${READY_TO_BILL}
        Click Element    ${YES_FOR_STATUS_CHANGE}
        Sleep    5s
    END

    Sleep    5s
    Element Should Not Be Visible   ${DETAILED_STATUS}
    
#Change status to Ready to bill
#    Click Element    ${BILLING_STATUS}
#    Click Element    ${READY_TO_BILL}
#    Click Element    ${YES_FOR_STATUS_CHANGE}

























    #    Input Text        ${OTP_PMS}    ${otp}[0]
#    wait until element is enabled    ${OTP_PMS}    ${TIMEOUT}
#    Input Text        ${OTP_PMS}    ${otp}[1]
#    wait until element is enabled    ${OTP_PMS}    ${TIMEOUT}
#    Input Text        ${OTP_PMS}    ${otp}[2]
#    wait until element is enabled    ${OTP_PMS}    ${TIMEOUT}
#    Input Text        ${OTP_PMS}    ${otp}[3]
#    wait until element is enabled    ${OTP_PMS}    ${TIMEOUT}
#    Input Text        ${OTP_PMS}    ${otp}[4]
#    wait until element is enabled    ${OTP_PMS}    ${TIMEOUT}
#    Input Text        ${OTP_PMS}    ${otp}[5]