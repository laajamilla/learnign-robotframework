*** Settings ***

Documentation    A test suite for testing dropdown
Library    SeleniumLibrary

*** Variables ***

${URL}    https://ultimateqa.com/simple-html-elements-for-automation/
${BROWSER}    Chrome


*** Test Cases ***
Testing dropdown list
    Open Browser To Test Page
    Select Opel    Opel
    Selection successfull
    [Teardown]    Close Browser


*** Keywords ***
Open Browser To Test Page
    Open Browser    ${URL}    ${BROWSER}
    Page Should Contain    Click button using ClassName

Select Opel
    [Arguments]    ${LISTVALUE}
    Select from list by value    xpath://select    ${LISTVALUE}

Selection successfull
    List Selection Should Be    //select    Opel