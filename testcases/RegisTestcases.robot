*** Settings ***
Library         SeleniumLibrary
Resource        ../keywords/RegisPageKeywords.robot
Resource        ../keywords/OtpPageKeywords.robot
Variables       ../resources/config/config.yaml
Variables       ../resources/testdata/testdata.yaml
Suite Setup        Open Browser    ${baseUrl}    chrome
Suite Teardown     Close Browser


*** Test Cases ***
As a user, I fail to register with reuse email
    When user register to future skill platfrom with ${reuse_email} , ${firstname} , ${lastname} , ${phonenumber} , ${valid_new_password} , ${valid_confirm_password}
    Then future skill should display validate register fail message as "อีเมล นี้ถูกใช้แล้ว"  
    [Teardown]  user back from register page

As a user, I want to register success with valid credential
    When user register to future skill platfrom with ${email} , ${firstname} , ${lastname} , ${phonenumber} , ${valid_new_password} , ${valid_confirm_password}
    Then future skill should display otp page and display message as "ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์"
    [Teardown]  user back from otp page

As a user, I fail to register with invalid phonenumber 
    When user register to future skill platfrom with ${email} , ${firstname} , ${lastname} , ${invalid_phonenumber} , ${valid_new_password} , ${valid_confirm_password}
    Then future skill should display validate register fail message as "เบอร์โทรศัพท์ไม่ถูกต้อง"  
    [Teardown]  user back from register page

As a user, I fail to register with invalid new password 
    When user register to future skill platfrom with ${email} , ${firstname} , ${lastname} , ${phonenumber} , ${invalid_new_password} , ${valid_confirm_password}
    Then future skill should display validate register fail message as "รหัสผ่าน 8 ตัวขึ้นไป" 
    [Teardown]  user back from register page

As a user, I fail to register with invalid confirm new password 
    When user register to future skill platfrom with ${email} , ${firstname} , ${lastname} , ${phonenumber} , ${valid_new_password} , ${invalid_confirm_password}
    Then future skill should display validate register fail message as "รหัสผ่านไม่ตรงกัน" 
    [Teardown]  user back from register page

As a user, I fail to register without checkbox consent
    When user register to future skill platfrom without selected consent checkbox ${email} , ${firstname} , ${lastname} , ${phonenumber} , ${valid_new_password} , ${valid_confirm_password}
    Then future skill should display validate red frame checkbox consent 
    [Teardown]  user back from register page
