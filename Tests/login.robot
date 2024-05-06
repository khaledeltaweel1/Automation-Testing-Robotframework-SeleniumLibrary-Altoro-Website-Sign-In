*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${website}      http://altoro.testfire.net/
${username}     admin
${password}     admin

*** Test Cases ***

Sign In

    [Documentation]  This test case sign in the user to Altoro website

#    Open google Microsoft Edge browser, you can change the browser to [chrome , firefox]
    Open Browser    ${website}    edge

#    maximize browser window size
    maximize browser window

#    Click on Sign In
    click element   xpath://*[@id="LoginLink"]/font

#    wait until page redirection to the sign in page, max wait time is 10 secons
    wait until page contains    Online Banking Login        10


#    Enter username in the username field
    input text  xpath://input[contains(@name,'uid')]    ${username}


#    Enter password in the password field
    input text  xpath://input[contains(@id,'passw')]    ${password}

#    Click on Login button
    click element   xpath://input[contains(@name,'btnSubmit')]

Validate login

    [Documentation]  This test case validates that the user has signed in successfully
    ...     and the welcome message is displayed

    #    Validate that the user has signed in successfully, max wait time is 10 seconds
    wait until page contains    Hello Admin User        10

closebrowser
    [Documentation]     This test case closes the browser

    Close Browser