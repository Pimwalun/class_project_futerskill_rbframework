*** Settings ***
Library         SeleniumLibrary
Resource        CommonKeywords.robot

*** Keywords ***
future skill should display otp page and display message as "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}

user back from otp page
    CommonKeywords.Wait until element is ready then click element  xpath=//button[contains(text(),"กลับ")]