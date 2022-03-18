*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary


*** Variables ***
${base_URL}     https://gorest.co.in
${endpoint}    /public/v1/users

*** Test Cases ***
Gorest Get Request

    create session  mysesion    ${base_URL}

    ${response}=    get on session    mysesion    ${endpoint}

    Should Not Be Empty   ${response.content}
    Status Should Be  200

    ${json_response}=   set variable    ${response.json()}
    ${total}=   get value from json     ${json_response}         meta.pagination.total
    ${pages}=   get value from json     ${json_response}         meta.pagination.pages
    ${page}=    get value from json      ${json_response}        meta.pagination.page
    ${limit}=   get value from json     ${json_response}         meta.pagination.limit

    Should not be empty     {total}
    Should not be empty     {pages}
    Should not be empty     {page}
    Should not be empty     {limit}