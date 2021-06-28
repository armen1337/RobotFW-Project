*** Settings ***
Documentation  Searching a text and checking whether
...            the total amount of items per page is equal
...            to the specified amount of items per page.


Library  SeleniumLibrary
Resource  ../../Resources/Commons.robot
Variables  ../../Resources/pageObjects/ebay_page_objects.py

Suite Setup  Commons.Start Test  https://www.ebay.com/  ${browser}
Suite Teardown  Commons.Finish Test


*** Variables ***
# Variables are inherited from  "../../Resources/pageObjects/ebay_page_objects.py"


*** Test Cases ***
The Number Of Results Per Page Should be Equal To Selected Amount
    [Documentation]  Search '${search_text}' and check if search results per page is equal to 25

    Input Text  id:${search_field}  ${search_text}
    Click Button  id:${search_button}

    Wait Until Page Contains Element  ${dropdown_button}
    Click Button  ${dropdown_button}
    Click Link  xpath:${first_button_of_dropdown}

    Wait Until Page Contains Element  xpath:${item}

    ${actual_item_count}  Get Element Count  xpath:${item}
    Should Be Equal As Integers  ${actual_item_count}  25

