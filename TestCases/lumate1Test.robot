*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource   ../Locators/lumate1Locator.robot
Resource   ../Resources/lumate1Resource.robot

#Suite Setup    Run Keywords        Open PMS Url On Browser
#...                                Fill the credentials and login
#...                                Enter OTP and Submit it

*** Test Cases ***

Verify that the user is able to Log in to the Portal with correct credentials
    [Tags]    TC-PMS-001
    Open PMS Url On Browser
    Fill the credentials and login
    [Teardown]    Close Browser

Verify that the user gets redirected to enter OTP page when entered the correct credentials.
    [Tags]    TC-PMS-005
    Open PMS Url On Browser
    Fill the credentials and login
    Wait Until Element Contains   ${OTP_PAGE}    Almost There    ${TIMEOUT}
#    [Teardown]    Close Browser

Verify the clinician Home Page
    [Tags]    TC-APP-001
    Enter OTP and Submit it
    Wait Until Element Is Visible    ${TO-DO_HOME}    ${TIMEOUT}
    Element Should Contain   ${TO-DO_HOME}    TO DO's
    Element Should Contain   ${APPOINTMENT_HOME}    Appointments

Verify the Calender & appointments screen
    [Tags]    TC-APP-002
    Wait Until The Update Icon Disappear
    Click Element     ${APPOINTMENT_SEC}
    Wait Until The Update Icon Disappear
    verify elements of TC-APP-002 visible or not
    Wait Until The Update Icon Disappear

Verify the create an appointment button
    [Tags]    TC-APP-003
    [Setup]    Click Element    ${HOME_SEC}
    Create Appointment And Check Elements

Verify View Patient
    [Tags]    TC-PCV-001
    [Setup]    Click Element    ${HOME_SEC}
    Patient View Details Screen
    Wait Until The Update Icon Disappear

Verify Edit Patient
    [Tags]    TC-PCV-002
    [Setup]    Click Element    ${HOME_SEC}
    Patient Edit Details Screen
    Wait Until Element Is Visible    ${PATIENT_CHART}    ${TIMEOUT}
    Element Should Be Visible    ${PATIENT_CHART}
    Wait Until The Update Icon Disappear
    Sleep    2s

Verify the Basic details screen given under the Demographic section
    [Tags]    TC-PCV-003
    [Setup]    Click Element    ${HOME_SEC}
    Wait Until The Update Icon Disappear
    Patient Edit Details Screen
    Wait Until The Update Icon Disappear
    Wait Until Element Is Visible    ${BASIC_DETAILS_VIEW}    ${TIMEOUT}
    Element Should Be Visible    ${BASIC_DETAILS_VIEW}

Verify billing tab
    [Tags]    TC-PCV-004
    [Setup]    Click Element    ${HOME_SEC}
    Wait Until The Update Icon Disappear
    Patient Edit Details Screen
    Wait Until The Update Icon Disappear
    Wait Until Element Is Visible    ${BILLING_SEC}    ${TIMEOUT}
    Click Element    ${BILLING_SEC}
    Element Should Be Visible    ${BILLING_VIEW}
    Wait Until The Update Icon Disappear


Change billing status
    [Tags]    TC-PCV-005
    [Setup]    Click Element    ${HOME_SEC_ICON}
    Wait Until The Update Icon Disappear
    Patient Edit Details Screen
    Wait Until Element Is Visible    ${BILLING_SEC}    ${TIMEOUT}
    Click Element    ${BILLING_SEC}
    Wait Until Element Is Visible    //*[@class="d-flex billing-cards-overview m-b-30 ng-star-inserted"]
    Wait Until The Update Icon Disappear
    Changing status of billing to ready to bill
