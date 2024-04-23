*** Settings ***
Library    ImapLibrary2
Library    String
#Library    OperatingSystem
Library    pyperclip
Library    Collections
Library    ../PythonLib/copy-paste.py    WITH NAME    CustomKeywords
Resource   ../Locators/lumate1Locator.robot

*** Keywords ***

Open PMS url on browser
    Open Browser    url=${P_PORTAL_URL}    browser=${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN_PAGE_P_PORTAL}    15s

Fill the credentials and login
    Input Text        ${USERNAME_PATH_P_PORTAL}    ${USERNAME_P_PORTAL}
    Input Text        ${PASSWORD_PATH_P_PORTAL}    ${PASSWORD_P_PORTAL}
    Click Element     ${REMEMBER_ME}
    Click Element     ${LOGIN_BTN}

Enetr OTP and Submit it
    ${otp}=  Wait for OTP email
    CustomKeywords.Copy To Clipboard    ${otp}
#    Execute JavaScript    document.body.click()
    wait until element is enabled    ${OTP_P_PORTAL}    ${TIMEOUT}
    Press Keys    ${OTP_P_PORTAL}    CTRL+V
    Click Element    ${VALIDATE_OTP}
    sleep    10s
    Click Element    ${SELECT_DEPENDENT}
    sleep    10s

Wait for OTP Email
    Open Mailbox    host=${EMAIL_SERVER}   user=${EMAIL_USERNAME}   password=${EMAIL_PASSWORD}
    ${email_index}=    Wait For Email   sender=${SENDER_USERNAME}  status=UNSEEN   timeout=300
    ${email_body}=      Get Email Body    ${email_index}
    ${otp}=    Get Regexp Matches    ${email_body}    \\b\\d{6}\\b
    Log               OTP received: ${otp}
    RETURN          ${otp}[3]

Wait Until the Update Icon Disappear
    sleep  20s
    Wait Until Element Is Not Visible  ${UpdateIcon}    ${TIMEOUT}


Payment Of Clinician1
    sleep    5s
    Click Element    ${BILLING_SECTION}
    Wait Until Element Is Visible     ${BILLING_PAGE}    ${TIMEOUT}
    Wait Until the Update Icon Disappear
    Click Button    ${PAY1}
    Wait Until Element Is Visible    ${PAYMENT_POPUP}
    Wait Until the Update Icon Disappear
    Click Element    ${ADD_NEW_CARD}
    Sleep    ${TIMEOUT}
    Input Text    ${CARD_NUMBER_PATH}    ${CARD_NUMBER}
    Input Text    ${CARD_EXPIRY_PATH}    ${CARD_EXPIRY}
    Input Text    ${CARD_CVC_PATH}    ${CARD_CVC}
    Input Text    ${NAME_ON_CARD_PATH}    ${NAME_ON_CARD}
