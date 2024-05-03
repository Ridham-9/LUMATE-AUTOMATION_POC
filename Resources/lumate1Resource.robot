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
    Wait Until Element Is Visible    ${USERNAME_PATH_PMS}    15s
    Input Text        ${USERNAME_PATH_PMS}    ${USERNAME_PMS}
    Input Text        ${PASSWORD_PATH_PMS}    ${PASSWORD_PMS}
    Wait Until Element Is Visible    ${REMEMBER_ME}    15s
    Click Element     ${REMEMBER_ME}
    Click Button      ${LOGIN_BTN}

Enter OTP and Submit it
    ${otp}=  Wait for OTP email
    CustomKeywords.Copy To Clipboard    ${otp}
    Wait Until Element Is Visible    ${OTP_CLICK}    15s
    Click Element    ${OTP_CLICK}
    Wait Until Element Is Visible    ${OTP_PAGE}    ${TIMEOUT}
    wait until element is visible    ${OTP_PMS}    ${TIMEOUT}
    Press Keys    ${OTP_PMS}    CTRL+V
    Click Button      ${VALIDATE_OTP}
    Wait Until Element Is Visible    ${HOMEPAGE_PMS}

Wait for OTP Email
    Open Mailbox    host=${EMAIL_SERVER}   user=${EMAIL_USERNAME}   password=${EMAIL_PASSWORD}
    ${email_index}=    Wait For Email   sender=${SENDER_USERNAME}  status=UNSEEN   timeout=300
    ${email_body}=      Get Email Body    ${email_index}
    ${otp}=    Get Regexp Matches    ${email_body}    \\b\\d{6}\\b
    Delete Email    ${email_index}
    Log               OTP received: ${otp}
    RETURN          ${otp}[3]

Wait Until the Update Icon Disappear
#    ${Status}   Run Keyword and return status   Wait Until Element Is Visible    ${UpdateIcon}    ${TIMEOUT}
#    Run Keyword If    '${status}' == 'True'  Sleep  2s
#    Check Update Icon Status
    Wait Until Element Is Not Visible  ${UpdateIcon}    ${TIMEOUT_40}


#Check Update Icon Status
#    ${Status}   Run Keyword and return status   Wait Until Element Is Not Visible    ${UpdateIcon}    ${TIMEOUT}
#    Run Keyword If    '${status}' == 'False'  Wait Until the Update Icon Disappear


verify elements of TC-APP-002 visible or not
    Wait Until Element Is Visible  ${APPOINTMENT_CALENDER}    ${TIMEOUT_40}
    Element Should Be Visible   ${APPOINTMENT_CALENDER}    Today
    Element Should Be Visible    ${CREATE_APPOINTMENT}
    Wait Until The Update Icon Disappear
    Wait Until Element Is Enabled  ${OPEN_RIGHTBAR_FOR_CALANEDER}    ${TIMEOUT_40}
    Wait Until The Update Icon Disappear
#    Wait Until The Update Icon Disappear
#    Wait Until The Update Icon Disappear
    Sleep    2s
    Click Button    ${OPEN_RIGHTBAR_FOR_CALANEDER}
    Element Should Be Visible    ${Select_Office}    Select Office
    Wait Until Element Is Visible  ${Select_Clinicians}    ${TIMEOUT}
    Element Should Be Visible    ${Select_Clinicians}    Select Clinicians

Create Appointment and check elements
    Click Element     ${APPOINTMENT_SEC}
    Click Element     ${CREATE_APPOINTMENT}
    Wait Until Element Is Visible  ${SCHEDULED_APPOINTMENT}    ${Timeout}
    Element Should Contain    ${SCHEDULED_APPOINTMENT}    Schedule Appointment
    Wait Until Element Is Visible    ${APPOINTMENT_TYPE}    ${Timeout}
    Element Should Be Visible    ${APPOINTMENT_TYPE}
    Element Should Be Visible    ${BACK_BUTTON}

Patient View Details Screen
    Click Element    ${PATIENT_SEC}
    Wait Until Element Is Visible    ${VIEW_PATIENT1}    ${Timeout}
    Click Element    ${VIEW_PATIENT1}
    Wait Until Element Is Visible    ${PATIENT_DETAIL}    ${Timeout}
    Element Should Be Visible    ${PATIENT_DETAIL}

Patient Edit Details Screen
    Wait Until Element Is Visible    ${PATIENT_SEC}    ${Timeout}
    Click Element    ${PATIENT_SEC}
    Wait Until Element Is Visible    ${EDIT_PATIENT1}    ${Timeout}
    Click Element    ${EDIT_PATIENT1}

Changing status of billing to ready to bill
#    Click Element    ${UNBILLED_STATUS}
    ${COUNT}=    Get Element Count    ${DETAILED_STATUS}
    FOR     ${i}  IN RANGE      ${COUNT}
        Click Element    ${BILLING_STATUS}
        Click Element    ${READY_TO_BILL}
        Click Element    ${YES_FOR_STATUS_CHANGE}
        Wait Until The Update Icon Disappear
    END
    Element Should Not Be Visible   ${DETAILED_STATUS}


























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