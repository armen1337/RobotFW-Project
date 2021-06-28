*** Settings ***
Documentation  This test suite verifies that the
...            count of added to wishlist elements
...            is corresponding to the actual
...            element count in wishlist page.


Library  SeleniumLibrary
Resource  ../../Resources/Commons.robot
Variables  ../../Resources/pageObjects/ozon_page_objects.py


Test Setup  commons.Start Test  http://ozon.ru  ${browser}
Test Teardown  commons.Finish Test


*** Variables ***
${search_text}  hair dryer
${expected_count}  8

@{items}
@{add_to_wishlist_buttons}


*** Test Cases ***
Verify 'Add to wishlist' buttons and the count of wishlist items
    Search Text  ${search_text}
    Add Items To Wishlist  ${item_xpath}
    Go To Wishlist Page  ${wishlist_link}
    Check The Count Of Elements  ${item_xpath}



*** Keywords ***
Search Text
    [Arguments]  ${search_text}
    Input Text  ${search_field}  ${search_text}
    Click Button  ${search_button}



Add Items To Wishlist
    [Arguments]  ${item_xpath}
    Wait Until Page Contains Element  ${item_xpath}
    ${items}  Get Webelements  ${item_xpath}
    ${add_to_wishlist_buttons}  Get Webelements  ${add_to_wishlist_button}


    FOR  ${index}  IN RANGE  0  ${expected_count}
        Click Button  ${add_to_wishlist_buttons}[${index}]
    END
    Sleep  1


Go To Wishlist Page
    [Arguments]  ${wishlist_link}
    Click Link  ${wishlist_link}
    Wait Until Page Contains Element  ${item_xpath}


Check The Count Of Elements
    [Arguments]  ${item_xpath}
    Sleep  1
    ${actual_count}  Get Element Count  ${item_xpath}
    Should Be Equal As Integers  ${actual_count}  ${expected_count}

