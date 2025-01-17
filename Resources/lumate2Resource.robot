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

Open LUMCARE url on browser
    Open Browser    url=${P_PORTAL_URL}    browser=${Browser}   options=add_experimental_option("detach", True)
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN_PAGE_P_PORTAL}    15s

Fill the credentials and login
    Input Text        ${USERNAME_PATH_P_PORTAL}    ${USERNAME_P_PORTAL}
    Input Password    ${PASSWORD_PATH_P_PORTAL}    ${PASSWORD_P_PORTAL}
    Click Element     ${REMEMBER_ME}
    Wait Until Element Is Enabled    ${LOGIN_BTN}
    Click Element     ${LOGIN_BTN}

Enter OTP and Submit it
    ${otp}=  Wait for OTP Email
    CustomKeywords.Copy To Clipboard     ${otp}
    wait until element is enabled        ${OTP_P_PORTAL}    ${TIMEOUT}
    Press Keys                           ${OTP_P_PORTAL}    CTRL+V
    Click Element                        ${VALIDATE_OTP}
    Wait Until Element Is Visible        ${SELECT_DEPENDENT}    15s
    ${home}=    Run Keyword And Return Status    Page Should Not Contain    Please select any one dependent to proceed further
    Run Keyword If    ${home}    Enter OTP And Submit It

Select Dependent and Skip profile editing
    Wait Until Element Is Visible        ${SELECT_DEPENDENT}    15s
    Click Element                        ${SELECT_DEPENDENT}
    Wait Until the Update Icon Disappear
    Wait Until Element Is Enabled        ${SKIP}    15s
    Click Element    ${SKIP}
    sleep   2s
    Wait Until The Update Icon Disappear

Wait for OTP Email
    Open Mailbox    host=${EMAIL_SERVER}   user=${EMAIL_USERNAME}   password=${EMAIL_PASSWORD}
    ${email_index}=    Wait For Email   sender=${SENDER_USERNAME}  status=UNSEEN   timeout=300
    ${email_body}=      Get Email Body    ${email_index}
    Log    Received Email Body: ${email_body}
    ${otp}=    Get Regexp Matches    ${email_body}    \\b\\d{6}\\b
    Delete Email    ${email_index}
    Log               OTP received: ${otp}
    RETURN          ${otp}[3]


Wait Until the Update Icon Disappear
    Wait Until Element Is Not Visible  ${UpdateIcon}    80s
    Element Should Not Be Visible   ${UpdateIcon}

Payment Of Clinician1
    Wait Until Element Is Visible    ${BILLING_SECTION}
    Wait Until The Update Icon Disappear
    Click Element                        ${BILLING_SECTION}
    Wait Until Element Is Visible        ${BILLING_PAGE}    ${TIMEOUT}
    Wait Until the Update Icon Disappear
    Click Button                         ${PAY1}
    Wait Until the Update Icon Disappear
    Sleep    5s
#    Wait Until Element Is Visible        ${ADD_NEW_CARD}    ${TIMEOUT}
    Click Element                        ${ADD_NEW_CARD}
    Wait Until the Update Icon Disappear
#    Wait Until Element Is Visible        ${CARD_NUMBER_PATH}    ${TIMEOUT}
#    Mouse Over    ${CARD_NUMBER_PATH}
#    Click Element    ${CARD_NUMBER_PATH}
#    Input Text        ${CARD_NUMBER_PATH}    ${CARD_NUMBER}
#    Input Text                           ${CARD_EXPIRY_PATH}    ${CARD_EXPIRY}
#    Input Text                           ${CARD_CVC_PATH}    ${CARD_CVC}
    Input Text                           ${NAME_ON_CARD_PATH}    ${NAME_ON_CARD}

