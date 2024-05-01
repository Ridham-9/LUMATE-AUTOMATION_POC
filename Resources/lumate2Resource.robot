*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    ImapLibrary2
Library    String
Library    OperatingSystem
Library    pyperclip
Library    Collections
Library    ../PythonLib/copy-paste.py    WITH NAME    CustomKeywords
Resource   ../Locators/lumate2Locator.robot

*** Keywords ***

Open PMS url on browser
    Open Browser    url=${P_PORTAL_URL}    browser=${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN_PAGE_P_PORTAL}    15s

Fill the credentials and login
    Input Text        ${USERNAME_PATH_P_PORTAL}    ${USERNAME_P_PORTAL}
    Input Text        ${PASSWORD_PATH_P_PORTAL}    ${PASSWORD_P_PORTAL}
    Click Element     ${REMEMBER_ME}
    Wait Until Element Is Visible    ${LOGIN_BTN}
    Click Element     ${LOGIN_BTN}

Enter OTP and Submit it
    ${otp}=  Wait for OTP Email
    CustomKeywords.Copy To Clipboard     ${otp}
    wait until element is enabled        ${OTP_P_PORTAL}    ${TIMEOUT}
    Press Keys                           ${OTP_P_PORTAL}    CTRL+V
    Click Element                        ${VALIDATE_OTP}
    sleep    10s
    Click Element                        ${SELECT_DEPENDENT}
    sleep    10s
    ${SKIP_BTN}=  Run Keyword And Return Status  Element Should Be Visible    ${SKIP}
    Log    ${SKIP_BTN}
    Run Keyword If    ${SKIP_BTN}  Click Element    ${SKIP}
#
#Wait for OTP Email
#    Open Mailbox    host=${EMAIL_SERVER}   user=${EMAIL_USERNAME}   password=${EMAIL_PASSWORD}
#    ${email_index}=    Wait For Email   sender=${SENDER_USERNAME}  status=UNSEEN   timeout=30000    order=newest_first
#    ${email_body}=      Get Email Body    ${email_index}
#    ${subject_line}=      Get Line        ${email_index}    0
#    ${subject}=    Get Substring    ${subject_line}    5
##    ${email_bytes}=     Convert To Bytes    ${email_body}
##    ${email_headers}=    Evaluate    email.message_from_bytes($email_bytes)
##    ${subject}=    Set Variable    ${email_headers['Subject']}
#    Log    Subject of the email is: ${subject}
#    ${otp}=    Get Regexp Matches    ${email_body}    \\b\\d{6}\\b
#    Delete Email    ${email_index}
#    Log               OTP received: ${otp}
#    RETURN          ${otp}[3]

Wait for OTP Email
    Open Mailbox    host=${EMAIL_SERVER}   user=${EMAIL_USERNAME}   password=${EMAIL_PASSWORD}
    ${email_index}=    Wait For Email   sender=${SENDER_USERNAME}  status=UNSEEN   timeout=300
    ${email_body}=      Get Email Body    ${email_index}
    ${otp}=    Get Regexp Matches    ${email_body}    \\b\\d{6}\\b
    Delete Email    ${email_index}
    Log               OTP received: ${otp}
    RETURN          ${otp}[3]



Wait Until the Update Icon Disappear
    sleep  20s
    Wait Until Element Is Not Visible  ${UpdateIcon}    ${TIMEOUT}


Payment Of Clinician1
    sleep    10s
    Click Element                        ${BILLING_SECTION}
    Wait Until Element Is Visible        ${BILLING_PAGE}    ${TIMEOUT}
    Wait Until the Update Icon Disappear
    Click Button                         ${PAY1}
    Wait Until the Update Icon Disappear
    Click Element                        ${ADD_NEW_CARD}
    Wait Until Element Is Visible        ${CARD_NUMBER_PATH}    ${TIMEOUT}
    Input Text        ${CARD_NUMBER_PATH}    ${CARD_NUMBER}
#    Input Text                           ${CARD_EXPIRY_PATH}    ${CARD_EXPIRY}
#    Input Text                           ${CARD_CVC_PATH}    ${CARD_CVC}
    Input Text                           ${NAME_ON_CARD_PATH}    ${NAME_ON_CARD}
    
#Get Dynamic Xpath for card number
#    [Arguments]    ${PATH}
#    ${element}=    Get WebElement    ${PATH}
##    ${id}=    Get Element Attribute    ${element}    id
##    ${name}=    Get Element Attribute    ${element}    name
##    ${xpath}=    Set Variable    //input[@type='text' and @id='${id}' and @name='${name}']
#    RETURN    ${element}