*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Start Test
    [Arguments]  ${url}  ${browser}
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

Finish Test
    Close All Browsers
