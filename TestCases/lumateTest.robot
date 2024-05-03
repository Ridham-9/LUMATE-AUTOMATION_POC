*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource   ../Locators/lumate1Locator.robot
Resource   ../Resources/lumate1Resource.robot
Resource   ../Locators/lumate2Locator.robot
Resource   ../Resources/lumate2Resource.robot

#Suite Setup    Run Keywords        Open PMS Url On Browser
#...                                Fill the credentials and login
#...                                Enter OTP and Submit it
Suite Teardown    Close All Browsers
*** Test Cases ***

Verify patient signup
    [Tags]    test:retry(2)    TC-PATIENT-001
    Open LUMCARE Url On Browser
    lumate2Resource.Fill the credentials and login
    lumate2Resource.Enter OTP and Submit it
    Wait Until Element Is Visible    ${HOMEPAGE_P_PORTAL}    ${TIMEOUT}

Add consent forms
     [Tags]    TC-PATIENT-002
     Wait Until Element Is Visible    ${VIEW_CONSENT}    ${TIMEOUT}
     lumate2Resource.Wait Until The Update Icon Disappear
     Click Element    ${VIEW_CONSENT}
     lumate2Resource.Wait Until the Update Icon Disappear
     Element Should Be Visible    ${CONSENTS}

Bill payment
    [Tags]    TC-PATIENT-003
    lumate2Resource.Wait Until the Update Icon Disappear
    Click Element    ${HOME_SECTION}
    Payment Of Clinician1



Verify that the user is able to Log in to the Portal with correct credentials
    [Tags]    TC-PMS-001
    Open PMS Url On Browser
    lumate1Resource.Fill the credentials and login
    [Teardown]    Close Browser

Verify that the user gets redirected to enter OTP page when entered the correct credentials.
    [Tags]    TC-PMS-005
    Open PMS Url On Browser
    lumate1Resource.Fill the credentials and login
    Wait Until Element Contains   ${OTP_PAGE}    Almost There    ${TIMEOUT}
#    [Teardown]    Close Browser

Verify the clinician Home Page
    [Tags]    TC-APP-001
    lumate1Resource.Enter OTP and Submit it
    Wait Until Element Is Visible    ${TO-DO_HOME}    ${TIMEOUT}
    Element Should Contain   ${TO-DO_HOME}    TO DO's
    Element Should Contain   ${APPOINTMENT_HOME}    Appointments

Verify the Calender & appointments screen
    [Tags]    TC-APP-002
    lumate1Resource.Wait Until The Update Icon Disappear
    Click Element     ${APPOINTMENT_SEC}
    lumate1Resource.Wait Until The Update Icon Disappear
    verify elements of TC-APP-002 visible or not
    lumate1Resource.Wait Until The Update Icon Disappear

Verify the create an appointment button
    [Tags]    TC-APP-003
    [Setup]    Click Element    ${HOME_SEC}
    Create Appointment And Check Elements

Verify View Patient
    [Tags]    TC-PCV-001
    [Setup]    Click Element    ${HOME_SEC}
    Patient View Details Screen
    lumate1Resource.Wait Until The Update Icon Disappear

Verify Edit Patient
    [Tags]    TC-PCV-002
    [Setup]    Click Element    ${HOME_SEC}
    Patient Edit Details Screen
    Wait Until Element Is Visible    ${PATIENT_CHART}    ${TIMEOUT}
    Element Should Be Visible    ${PATIENT_CHART}
    lumate1Resource.Wait Until The Update Icon Disappear

Verify the Basic details screen given under the Demographic section
    [Tags]    TC-PCV-003
    [Setup]    Click Element    ${HOME_SEC}
    lumate1Resource.Wait Until The Update Icon Disappear
    Patient Edit Details Screen
    lumate1Resource.Wait Until The Update Icon Disappear
    Wait Until Element Is Visible    ${BASIC_DETAILS_VIEW}    ${TIMEOUT}
    Element Should Be Visible    ${BASIC_DETAILS_VIEW}

Verify billing tab
    [Tags]    TC-PCV-004
    [Setup]    Click Element    ${HOME_SEC}
    lumate1Resource.Wait Until The Update Icon Disappear
    Patient Edit Details Screen
    lumate1Resource.Wait Until The Update Icon Disappear
    Wait Until Element Is Visible    ${BILLING_SEC}    ${TIMEOUT}
    Click Element    ${BILLING_SEC}
    Element Should Be Visible    ${BILLING_VIEW}
    lumate1Resource.Wait Until The Update Icon Disappear
    Sleep    2s

Change billing status
    [Tags]    TC-PCV-005
    [Setup]    Click Element    ${HOME_SEC_ICON}
    lumate1Resource.Wait Until The Update Icon Disappear
    Patient Edit Details Screen
    Wait Until Element Is Visible    ${BILLING_SEC}    ${TIMEOUT}
    Click Element    ${BILLING_SEC}
    Wait Until Element Is Visible    //*[@class="d-flex billing-cards-overview m-b-30 ng-star-inserted"]
    lumate1Resource.Wait Until The Update Icon Disappear
    Changing status of billing to ready to bill


#
#Verify patient signup
#    [Tags]    test:retry(2)    TC-PATIENT-001
#    Open LUMCARE Url On Browser
#    lumate2Resource.Fill the credentials and login
#    lumate2Resource.Enter OTP and Submit it
#    Wait Until Element Is Visible    ${HOMEPAGE_P_PORTAL}    ${TIMEOUT}
#
#Add consent forms
#     [Tags]    TC-PATIENT-002
#     Wait Until Element Is Visible    ${VIEW_CONSENT}    ${TIMEOUT}
#     lumate2Resource.Wait Until The Update Icon Disappear
#     Click Element    ${VIEW_CONSENT}
#     lumate2Resource.Wait Until the Update Icon Disappear
#     Element Should Be Visible    ${CONSENTS}
#
#Bill payment
#    [Tags]    TC-PATIENT-003
##    [Setup]    Click Element    ${HOME_SECTION}
#    lumate2Resource.Wait Until the Update Icon Disappear
##    Wait Until the Update Icon Disappear
#    Click Element    ${HOME_SECTION}
#    Payment Of Clinician1