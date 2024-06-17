*** Variables ***

################################## VARIABLES ##################################
${Browser}                       chrome
${TIMEOUT}                       30s
${TIMEOUT_40}                    40s
${P_PORTAL_URL}                  https://qa-lumacare.lumatehealth.com/#/authentication/login
${USERNAME_P_PORTAL}             robert.grigsby
${PASSWORD_P_PORTAL}             Test1234!
${EMAIL_SERVER}                  imap.gmail.com
${EMAIL_USERNAME}                kalpesh.patel@acldigital.com
${EMAIL_PASSWORD}                ksdxbtbgbmekciiz
${SENDER_USERNAME}               it.notifications@lumatehealth.com
${CARD_NUMBER}                   4242424242424242
${CARD_EXPIRY}                   0425
${CARD_CVC}                      345
${NAME_ON_CARD}                  parth


#################################### XPATH ####################################

${LOGIN_PAGE_P_PORTAL}           xpath://div[2]/b[text()="Welcome To Lumate"]
${USERNAME_PATH_P_PORTAL}        xpath://*[@id="ion-input-0"]
${PASSWORD_PATH_P_PORTAL}        xpath://*[@id="ion-input-1"]
${REMEMBER_ME}                   xpath://*[@class="form-check-input"]
${LOGIN_BTN}                     xpath://*[@class="btn-primary font-20 fw-bold b-r-50 he-68 w-100 overflow-hidden md button button-solid ion-activatable ion-focusable hydrated"]
${OTP_P_PORTAL}                  xpath://*[@class="ng-otp-input-wrapper wrapper ng-star-inserted"]
${SELECT_DEPENDENT}              xpath://*[@class="overflow-y-auto"]
${VALIDATE_OTP}                  xpath://*[@class="btn-primary font-20 fw-bold b-r-50 he-68 w-100 overflow-hidden md button button-solid ion-activatable ion-focusable hydrated"]
${HOMEPAGE_P_PORTAL}             xpath://*[@class="ng-star-inserted ion-page"]
${SKIP}                          xpath://*[@class="font-20 bg-danger text-white lh-26 m-0 text-center fw-bold b-r-50 he-57 w-100 max-wi-680 overflow-hidden he-50 font-16"]
${UpdateIcon}                    xpath://*[@class="ng-tns-c2009170884-0 ng-star-inserted"]
${VIEW_CONSENT}                  xpath://*[@class="main-container p-a-15"]/div[2]/div/span[2]
${CONSENTS}                      xpath://*[@class="consents-container d-grid p-x-30 p-y-20"]
${BILLING_SECTION}               xpath://*[@class="he-50 d-flex align-items-center cursor-pointer b-r-20 ng-star-inserted"][2]
${HOME_SECTION}                  xpath://*[@class="he-50 d-flex align-items-center cursor-pointer b-r-20 ng-star-inserted"][1]
${BILLING_PAGE}                  xpath://*[@class="mat-mdc-tab-body-wrapper"]
${HOME_PAGE}                     xpath://*[@class="main-container p-a-15"]
${PAY1}                          xpath:/html/body/app-root/ion-app/ion-router-outlet/app-main/app-billing/div/mat-tab-group/div/mat-tab-body[1]/div/app-statements/div[3]/app-billing-card[1]/div/div[5]/button[2]
${PAY1}                          xpath://*[@id="mat-tab-content-0-0"]/div/app-statements/div[1]/div[2]/div/button
${ADD_NEW_CARD}                  xpath://*[@class="mdc-checkbox__native-control"]
#${CARD_NUMBER_PATH}              xpath:/html/body/div/form/div/div[2]/span[1]/span[2]/div/div[2]/span/input
#${CARD_NUMBER_PATH}              css:[#root > form > div > div.CardField-input-wrapper > span.CardField-number.CardField-child > span:nth-child(2) > div > div.CardNumberField-input-wrapper > span > input]
${CARD_NUMBER_PATH}              xpath://*[@class="InputElement is-empty Input Input--empty"]
${CARD_EXPIRY_PATH}              xpath://*[@id="root"]/form/div/div[2]/span[2]/span[1]/span/span
${CARD_CVC_PATH}                 xpath://*[@id="root"]/form/div/div[2]/span[2]/span[2]/span/span
${NAME_ON_CARD_PATH}             xpath://*[@id="mat-input-0"]
${PAYMENT_POPUP}                 xpath://*[@id="payment-method-popup"]

