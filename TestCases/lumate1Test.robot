*** Settings ***
Library    SeleniumLibrary
Resource   ../Locators/lumate1Locator.robot
Resource   ../Resources/lumate1Resource.robot

#Suite Setup    Run Keywords    Open PMS url on browser

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
    sleep    5s
    Element Should Contain   ${OTP_PAGE}    Almost There
    [Teardown]    Close Browser

Verify the clinician Home Page
    [Tags]    TC-APP-001
    Open PMS Url On Browser
    Fill the credentials and login
    Enetr OTP and Submit it
    sleep    10s 
    Element Should Contain   ${TO-DO_HOME}    TO DO's
    Element Should Contain   ${APPOINTMENT_HOME}    Appointments
    [Teardown]    Close Browser

Verify the Calender & appointments screen
    [Tags]    TC-APP-002
    sleep    30s
    Open PMS Url On Browser
    Fill the credentials and login
    Enetr OTP and Submit it
    sleep    10s
    Click Element     ${APPOINTMENT_SEC}
    sleep    10s
    verify elements of TC-APP-002 visisble or not
    
Verify the create an appointment button
    [Tags]    TC-APP-003
    sleep    30s
    Open PMS Url On Browser
    Fill the credentials and login
    Enetr OTP and Submit it
    sleep    10s
    Creat Appointment and check elements

