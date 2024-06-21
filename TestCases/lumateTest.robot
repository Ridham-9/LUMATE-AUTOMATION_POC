*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource   ../Locators/lumate1Locator.robot
Resource   ../Resources/lumate1Resource.robot
Resource   ../Locators/lumate2Locator.robot
Resource   ../Resources/lumate2Resource.robot

#Suite Setup    Run Keywords        Open PMS Url On Browser
#...                                lumate1Resource.Fill the credentials and login
#...                                lumate1Resource.Enter OTP and Submit it

#Suite Teardown    Close All Browsers

*** Test Cases ***

################################## PMS ##################################

Verify that the user is able to Log in to the Portal with correct credentials
    [Tags]    Lumate_POC_TC_001
    Open PMS Url On Browser
    lumate1Resource.Fill the credentials and login
    Close Browser

Verify that the user gets redirected to enter OTP page when entered the correct credentials.
    [Tags]    Lumate_POC_TC_002
    Open PMS Url On Browser
    lumate1Resource.Fill the credentials and login
    Wait Until Element Contains   ${OTP_PAGE}    Almost There    ${TIMEOUT}

Verify the clinician Home Page
    [Tags]    Lumate_POC_TC_003
    lumate1Resource.Enter OTP and Submit it
    Wait Until Element Is Visible    ${TO-DO_HOME}    ${TIMEOUT}
    Element Should Contain   ${TO-DO_HOME}    TO DO's
    Element Should Contain   ${APPOINTMENT_HOME}    Appointments

Verify the Calender & appointments screen
    [Tags]    Lumate_POC_TC_004
    lumate1Resource.Wait Until The Update Icon Disappear
    Click Element    ${APPOINTMENT_SEC}
    lumate1Resource.Wait Until The Update Icon Disappear
    verify elements of TC-PMS-004 visible or not
    lumate1Resource.Wait Until The Update Icon Disappear
    Wait Until Element Is Enabled    ${HOME_SEC}    ${TIMEOUT_40}
    Element Should Be Enabled   ${HOME_SEC}

Verify the create an appointment button
    [Tags]    Lumate_POC_TC_005
    [Setup]    Click Element    ${HOME_SEC}
    Create Appointment And Check Elements
    Element Should Be Enabled   ${HOME_SEC}

Verify View Patient
    [Tags]    Lumate_POC_TC_006
    [Setup]    Click Element    ${HOME_SEC}
    Patient View Details Screen
    lumate1Resource.Wait Until The Update Icon Disappear
    Wait Until Element Is Enabled    ${HOME_SEC}    ${TIMEOUT_40}
    Element Should Be Enabled   ${HOME_SEC}

Verify Edit Patient
    [Tags]    Lumate_POC_TC_007
    [Setup]    Click Element    ${HOME_SEC}
    Patient Edit Details Screen
    Wait Until Element Is Visible    ${PATIENT_CHART}    ${TIMEOUT}
    Element Should Be Visible    ${PATIENT_CHART}
    lumate1Resource.Wait Until The Update Icon Disappear
    Wait Until Element Is Enabled    ${HOME_SEC}    ${TIMEOUT_40}
    Element Should Be Enabled   ${HOME_SEC}
    lumate1Resource.Wait Until The Update Icon Disappear
    sleep   2s

Verify the Basic details screen given under the Demographic section
    [Tags]    Lumate_POC_TC_008
    [Setup]    Click Element    ${HOME_SEC}
    lumate1Resource.Wait Until The Update Icon Disappear
    Patient Edit Details Screen
    lumate1Resource.Wait Until The Update Icon Disappear
    Wait Until Element Is Visible    ${BASIC_DETAILS_VIEW}    ${TIMEOUT}
    Element Should Be Visible    ${BASIC_DETAILS_VIEW}
    lumate1Resource.Wait Until The Update Icon Disappear
    Wait Until Element Is Enabled    ${HOME_SEC}    ${TIMEOUT_40}
    Element Should Be Enabled   ${HOME_SEC}

Verify billing tab
    [Tags]    Lumate_POC_TC_009
    [Setup]    Click Element    ${HOME_SEC}
    lumate1Resource.Wait Until The Update Icon Disappear
    Patient Edit Details Screen
    Wait Until Element Is Enabled    ${BILLING_SEC}    ${TIMEOUT}
    Element Should Be Enabled   ${BILLING_SEC}
    Click Element    ${BILLING_SEC}
    Element Should Be Visible    ${BILLING_VIEW}
    lumate1Resource.Wait Until The Update Icon Disappear
    Wait Until Element Is Enabled    ${HOME_SEC_ICON}    ${TIMEOUT_40}
    Element Should Be Enabled   ${HOME_SEC_ICON}

Change billing status
    [Tags]    Lumate_POC_TC_010
    [Setup]    Click Element    ${HOME_SEC_ICON}
    lumate1Resource.Wait Until The Update Icon Disappear
    Patient Edit Details Screen
    Wait Until Element Is Enabled    ${BILLING_SEC}    ${TIMEOUT}
    Click Element    ${BILLING_SEC}
    Wait Until Element Is Visible    //*[@class="d-flex billing-cards-overview m-b-30 ng-star-inserted"]
    lumate1Resource.Wait Until The Update Icon Disappear
    Changing status of billing to ready to bill
    Close Browser

################################## LUMCARE ##################################

Verify patient signup
    [Tags]    Lumate_POC_TC_011
    Open LUMCARE Url On Browser
    lumate2Resource.Fill the credentials and login
    lumate2Resource.Enter OTP and Submit it
    Select Dependent and Skip profile editing
    Wait Until Element Is Visible    ${HOMEPAGE_P_PORTAL}    ${TIMEOUT}

Add consent forms
     [Tags]    Lumate_POC_TC_012
     Wait Until Element Is Visible    ${VIEW_CONSENT}    ${TIMEOUT}
     lumate2Resource.Wait Until The Update Icon Disappear
     Click Element    ${VIEW_CONSENT}
     lumate2Resource.Wait Until the Update Icon Disappear
     Element Should Be Enabled    ${CONSENTS}

Bill payment
    [Tags]    Lumate_POC_TC_013
    lumate2Resource.Wait Until the Update Icon Disappear
    Click Element    ${HOME_SECTION}
    Payment Of Clinician1
    Close Browser