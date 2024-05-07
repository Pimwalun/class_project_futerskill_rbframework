*** Settings ***
Library         SeleniumLibrary
Resource        CommonKeywords.robot

*** Keywords ***
user register to future skill platfrom with ${username} , ${firstName} , ${lastname} , ${phonenumber} , ${newpassword} , ${confirmpassword}
    CommonKeywords.Wait until element is ready then click element   xpath=//button[contains(text(),"สมัครสมาชิก")]
    CommonKeywords.Wait until element is ready then input text      name=email              ${username}
    CommonKeywords.Wait until element is ready then input text      name=firstName          ${firstName}
    CommonKeywords.Wait until element is ready then input text      name=lastName           ${lastname}   
    CommonKeywords.Wait until element is ready then input text      name=phoneNumber        ${phonenumber}
    CommonKeywords.Wait until element is ready then input text      name=newPassword        ${newpassword}
    CommonKeywords.Wait until element is ready then input text      name=confirmPassword    ${confirmpassword}
    CommonKeywords.Wait until element is ready then select checkbox     name=consent
    CommonKeywords.Wait until element is ready then click element   xpath=//button[@type="submit" and text()="สมัครสมาชิก"]

user register to future skill platfrom without selected consent checkbox ${username} , ${firstName} , ${lastname} , ${phonenumber} , ${newpassword} , ${confirmpassword}
    CommonKeywords.Wait until element is ready then click element   xpath=//button[contains(text(),"สมัครสมาชิก")]
    CommonKeywords.Wait until element is ready then input text      name=email              ${username}
    CommonKeywords.Wait until element is ready then input text      name=firstName          ${firstName}
    CommonKeywords.Wait until element is ready then input text      name=lastName           ${lastname}   
    CommonKeywords.Wait until element is ready then input text      name=phoneNumber        ${phonenumber}
    CommonKeywords.Wait until element is ready then input text      name=newPassword        ${newpassword}
    CommonKeywords.Wait until element is ready then input text      name=confirmPassword    ${confirmpassword}
    CommonKeywords.Wait until element is ready then click element   xpath=//button[@type="submit" and text()="สมัครสมาชิก"]

future skill should display validate register fail message as "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}

future skill should display validate red frame checkbox consent
    CommonKeywords.Wait until page contains element then verify checkbox not be selected   name=consent

user back from register page
    CommonKeywords.Wait until element is ready then click element       xpath=//div[contains(text(),"กลับหน้าแรก")]


