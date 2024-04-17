*** Keywords ***

Open LUMATE url on browser
    Open Browser    url=${URL}    browser=${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible
