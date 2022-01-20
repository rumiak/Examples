*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    OperatingSystem

*** Test Cases ***
Get Requests
    Create Session    github         http://api.github.com
    Create Session    google         http://www.google.com
    ${resp}=          Get Request    google               /
    Status Should Be  200            ${resp}
    ${resp}=          Get Request    github               /users/bulkan
    Request Should Be Successful     ${resp}
    Dictionary Should Contain Value  ${resp.json()}       Bulkan Evcimen