*** Settings ***
Documentation  Tests to make sure the website is
...            showing proper error messages if
...            improper credentials were provided
...            using a data-driven testing approach.

Library  SeleniumLibrary
Library  DataDriver  ../../TestData/TestCredentials.xlsx  sheet_name=TestCredentials
Resource  ../../Resources/Commons.robot

Suite Setup  commons.Start Test  http://projectfortesvan.herokuapp.com  ${browser}
Suite Teardown  commons.Finish Test

Test Template  Invalid Login Scenarios


*** Variables ***
${username_field}  //input[@type="text"]
${password_field}  //input[@type="password"]
${signin_button}  //button[@type="submit"]
${error_msg_field}  //div[@class="error-message"]


*** Test Cases ***
Login with username ${username} and password ${password}  ${username}  ${password}  ${error_msg}


*** Keywords ***
Invalid Login Scenarios
    [Arguments]  ${username}  ${password}  ${error_msg}
    Input Text  ${username_field}  ${username}
    Input Text  ${password_field}  ${password}
    Click Button  ${signin_button}

    Wait Until Page Contains Element  ${error_msg_field}
    Element Should Contain  ${error_msg_field}  ${error_msg}

