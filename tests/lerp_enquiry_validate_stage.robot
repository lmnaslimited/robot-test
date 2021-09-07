*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    data/credentials.robot
Resource    keywords/lerp_keyword.robot
Suite Setup     RobotSetup
Suite Teardown  RobotTeardown
*** Test Cases ***
TC1
    [Tags]      smoke       regression
    [Documentation]         To check on Accounting
    Element Should Be Visible  xpath://h3[text()='Accounting']
TC2
    [Tags]     regression   test
    [Documentation]         Click and verify support link is working
    Click Element   xpath://span[text()='CRM']
    Element Should Be Visible  xpath://h3[text()='CRM']
    Click Element   xpath://div[text() = 'Enquiry']
    Set Selenium Implicit Wait      5
    Click Element   xpath://span[contains(text(),'filter')]
    Set Selenium Implicit Wait      10
    Click Element   xpath://button[contains(text(),'Clear Filters')]
    Click Button   xpath://button[contains(text(),'Clear Filters')]
    Set Selenium Implicit Wait      5

TC3
    [Tags]     test
    Click Element       xpath://a[@title='A SELVAN']
    Element Should Be Visible   xpath://h3[text()='A SELVAN']
    Scroll Element Into View    xpath://input[@data-target ='Sales Stage']
    ${TEXT}=        Get Value    xpath://input[@data-target ='Sales Stage']
    ${GET_Number}=      Split String    ${TEXT}
    ${str3}=   Catenate    SEPARATOR=  ${GET_Number}[1]   0%
    ${str4}=        Get Text    xpath://div[@data-fieldname ='probability']//div[@class ='control-value like-disabled-input']
    Should Be Equal     ${str3}   ${str4}
