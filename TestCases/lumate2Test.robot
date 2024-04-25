*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource   ../Locators/lumate2Locator.robot
Resource   ../Resources/lumate2Resource.robot

Suite Setup    Run Keywords        Open PMS Url On Browser
...                                Fill the credentials and login
...                                Enter OTP and Submit it

*** Test Cases ***

Verify patient signup
    [Tags]    test:retry(2)    TC-PATIENT-001
    Open PMS Url On Browser
    Fill the credentials and login
    Enter OTP and Submit it
    Wait Until Element Is Visible    ${HOMEPAGE_P_PORTAL}    ${TIMEOUT}

Add consent forms
     [Tags]    TC-PATIENT-002
     Wait Until the Update Icon Disappear
     Click Element    ${VIEW_CONSENT}
     Wait Until the Update Icon Disappear
     Element Should Be Visible    ${CONSENTS}

Bill payment
    [Tags]    TC-PATIENT-003
#    [Setup]    Click Element    ${HOME_SECTION}
    Sleep    5s
    Payment Of Clinician1