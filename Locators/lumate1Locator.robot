*** Variables ***

################################## VARIABLES ##################################

${Browser}                  chrome
${TIMEOUT}                  35s
${TIMEOUT_40}               40s
${PMS_URL}                  https://qa-pms.lumatehealth.com/
${USERNAME_PMS}             kalpesh
${PASSWORD_PMS}             Test1234!
${EMAIL_SERVER}             imap.gmail.com
${EMAIL_USERNAME}           kalpesh.patel@acldigital.com
${EMAIL_PASSWORD}           ksdxbtbgbmekciiz
${SENDER_USERNAME}          it.notifications@lumatehealth.com
${EMAIL_SUBJECT}            Lumate Health Authentication OTP:






#################################### XPATH ####################################

${USERNAME_PATH_PMS}                 xpath://*[@id="mat-input-0"]
${PASSWORD_PATH_PMS}                 xpath://*[@id="mat-input-1"]
${LOGIN_PAGE_PMS}                    xpath://*[@class="welcome-text"]
${REMEMBER_ME_PMS}                   xpath://*[@class="check remember-check"]
${LOGIN_BTN_PMS}                     xpath://*[@class="mat-focus-indicator auth-form-btn mat-raised-button mat-button-base mat-primary"]
${VALIDATE_OTP_PMS}                  xpath://*[@class="mat-focus-indicator auth-form-btn mat-flat-button mat-button-base mat-primary"]
${HOMEPAGE_PMS}                      xpath://*[@class="content-block p-a-25 overflow-y-auto"]
${OTP_PMS}                           xpath://*[@class="otp-input ng-pristine ng-valid ng-star-inserted ng-touched"]
${OTP_PAGE}                          xpath://*[@class="login-heading"]
${OTP_CLICK}                         xpath://*[@class="information-text resend-otp m-auto p-t-10"]
${UpdateIcon}                        xpath://*[@class="ng-tns-c2009170884-0 ng-star-inserted"]
${HOME_SEC}                          xpath://*[@id="leftsidebar"]/div/ul/div/li[2]/a
${HOME_SEC_ICON}                     xpath://*[@id="leftsidebar"]/div/ul/div/li[2]/a
${OPEN_RIGHTBAR_FOR_CALANEDER}       xpath://*[@class="toggle-sidebar-button he-36 wi-24 bg-secondary text-white position-absolute"]
${TO-DO_HOME}                        xpath://*[@class="to-do-container h-100"]
${APPOINTMENT_HOME}                  xpath://*[@class="appointment-container h-100"]
${APPOINTMENT_SEC}                   xpath://*[@id="leftsidebar"]/div/ul/div/li[3]/a
${CREATE_APPOINTMENT}                xpath://*[@class="d-block d-xxl-none position-absolute m-t-8 he-38 wi-38 b-r-10 p-a-7 btn-primary text-white w-auto"]
${Select_Office}                     xpath://*[@class="card border-bottom-0"]
${Select_Clinicians}                 xpath://*[@class="d-flex align-items-center"]
${States_Field}                      xpath://*[@class="p-x-10 p-y-10 d-flex justify-content-between align-items-center"]
${SCHEDULED_APPOINTMENT}             xpath://*[@class="block-header"]
${APPOINTMENT_CALENDER}              xpath://*[@class="appointment-calendar h-100"]
${APPOINTMENT_TYPE}                  xpath://*[@class="p-x-18 col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-6 col-xxl-6"]
${BACK_BUTTON}                       xpath://*[@class="d-flex m-a-20"]
${PATIENT_SEC}                       xpath://*[@id="leftsidebar"]/div/ul/div/li[4]/a
${VIEW_PATIENT1}                     xpath://*[@class="fa-solid fa-circle-info font-18 text-white"]
${PATIENT_DETAIL}                    xpath://*[@class="upper-body d-flex align-items-center"]
${EDIT_PATIENT1}                     xpath://*[@class="fa-solid fa-pen-to-square font-18 text-white"]
${PATIENT_CHART}                     xpath://*[@class="p-a-15"]
${BASIC_DETAILS}                     xpath://*[@class="mat-ripple mat-tab-label mat-focus-indicator ng-star-inserted mat-tab-label-active"]
${BASIC_DETAILS_VIEW}                xpath://*[@class="mat-tab-body-wrapper"]
${BILLING_SEC}                       xpath://*[@class="content-block"]/div/div/div/div[3]/li[8]
${BILLING_VIEW}                      xpath://*[@class="d-flex billing-cards-overview m-b-30 ng-star-inserted"]
${BILLING_STATUS}                    xpath://*[@class="mat-cell cdk-cell cdk-column-Status mat-column-Status ng-star-inserted"]/mat-form-field
${READY_TO_BILL}                     xpath://span[@class='mat-option-text' and contains(text(), 'Ready to Bill')]
${YES_FOR_STATUS_CHANGE}             xpath://*[@class="wi-183 he-38 b-r-10 bg-primary d-flex align-items-center justify-content-center"]
${UNBILLED_STATUS}                   xpath://*[@aria-label="Unbilled"]
${DETAILED_STATUS}                   xpath://*[@class="mat-row cdk-row ng-star-inserted"]
#${DETAILED_STATUS}                   xpath://*[@class="mat-table cdk-table mat-elevation-z8 w-100"]/tbody/tr



