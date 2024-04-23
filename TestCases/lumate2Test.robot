*** Settings ***
Library    SeleniumLibrary
Resource   ../Locators/lumate2Locator.robot
Resource   ../Resources/lumate2Resource.robot

#Suite Setup    Run Keywords    Open PMS url on browser

*** Test Cases ***

Verify patient signup
    [Tags]    TC-P_PORTAL-001
    Open PMS Url On Browser
    Fill the credentials and login
    Enetr OTP and Submit it
    Click Element    ${SKIP}
    Wait Until Element Is Visible    ${HOMEPAGE_P_PORTAL}    ${TIMEOUT}

Add consent forms
     [Tags]    TC-P_PORTAL-002
     Wait Until the Update Icon Disappear
     Click Element    ${VIEW_CONSENT}
     Wait Until the Update Icon Disappear
     Element Should Be Visible    ${CONSENTS}

Bill payment
    [Tags]    TC-P_PORTAL-003
    [Setup]    Click Element    ${HOME_SECTION}
    Sleep    5s
    Payment Of Clinician1