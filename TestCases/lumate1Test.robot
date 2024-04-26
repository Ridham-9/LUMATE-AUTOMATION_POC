*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource   ../Locators/lumate1Locator.robot
Resource   ../Resources/lumate1Resource.robot

Suite Setup    Run Keywords        Open PMS Url On Browser
...                                Fill the credentials and login
...                                Enter OTP and Submit it

*** Test Cases ***

Verify that the user is able to Log in to the Portal with correct credentials
    [Tags]    TC-PMS-001
    Open PMS Url On Browser
    Fill the credentials and login
#    [Teardown]    Close Browser

Verify that the user gets redirected to enter OTP page when entered the correct credentials.
    [Tags]    TC-PMS-005
    Open PMS Url On Browser
    Fill the credentials and login
    sleep    5s
    Element Should Contain   ${OTP_PAGE}    Almost There
#    [Teardown]    Close Browser

Verify the clinician Home Page
    [Tags]    TC-APP-001
    Enetr OTP and Submit it
    Element Should Contain   ${TO-DO_HOME}    TO DO's
    Element Should Contain   ${APPOINTMENT_HOME}    Appointments

Verify the Calender & appointments screen
    [Tags]    TC-APP-002
    Click Element     ${APPOINTMENT_SEC}
    sleep    10s
    verify elements of TC-APP-002 visisble or not

Verify the create an appointment button
    [Tags]    TC-APP-003
    [Setup]    Click Element    ${HOME_SEC}
    Creat Appointment and check elements

Verify View Patient
    [Tags]    TC-PCV-001
    [Setup]    Click Element    ${HOME_SEC}
    Patient View Details Screen

Verify Edit Patient
    [Tags]    TC-PCV-002
    [Setup]    Click Element    ${HOME_SEC}
    Patient Edit Details Screen
#    page should contain    ${PATIENT_CHART}  Demographics, Appointments, Forms, Diagnosis, Allergies, Medication, Billing, Shared Content
    Element Should Be Visible    ${PATIENT_CHART}

Verify the Basic details screen given under the Demographic section
    [Tags]    TC-PCV-003
    [Setup]    Click Element    ${HOME_SEC}
    Patient Edit Details Screen
#    Click Element    ${BASIC_DETAILS}
    Element Should Be Visible    ${BASIC_DETAILS_VIEW}

Verify billing tab
    [Tags]    TC-PCV-004
    [Setup]    Click Element    ${HOME_SEC}
    Patient Edit Details Screen
    Click Element    ${BILLING_SEC}
    Element Should Be Visible    ${BILLING_VIEW}
    sleep    5s


Change billing status
    [Tags]    TC-PCV-005
    [Setup]    Click Element    ${HOME_SEC_ICON}
    Patient Edit Details Screen
    Click Element    ${BILLING_SEC}
    Sleep    5s
    Changing status of billing to ready to bill
