*** Settings ***

Documentation    A test suite for testing buttons
Library    SeleniumLibrary

*** Variables ***

${URL}    https://ultimateqa.com/simple-html-elements-for-automation/
${BROWSER}    Chrome
${CLICKMEBUTTON}    (//button)[contains(text(), "Click Me")]
${CLICKMELINK}    (//a)[contains(text(), "Click Me")]

*** Test Cases ***
Open browser and test page content
    Open Browser    ${URL}    ${BROWSER}
    Page Should Contain    Click button using ClassName
    [Teardown]    Close Browser

Test to click button Click Me
    Open Browser    ${URL}    ${BROWSER}
    Click Button    ${CLICKMEBUTTON}
    Sleep    4 seconds
    Page Should Contain    about to submit is not secure
    Sleep    4 seconds
    [Teardown]    Close Browser

Test to click link Click Me!
    Open Browser    ${URL}    ${BROWSER}
    Click Link    locator=link:Click me using this link text!
    Sleep    4 seconds
    Page Should Contain    Link success
    Sleep    4 seconds
    [Teardown]    Close Browser

Test to click link Ckick Me looks like button
    Open Browser    ${URL}    ${BROWSER}
    Click Link    ${CLICKMELINK}
    Sleep    4 seconds
    ${URL}    Get Location
    Should Match    ${URL}    https://ultimateqa.com/button-success
    Page Should Contain    Button success
    Sleep    4 seconds
    [Teardown]    Close Browser
