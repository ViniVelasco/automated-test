*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Login com sucesso
    Go To                           ${url}/login
    Login With                      stark    jarvis!
    Should See Logged User          Tony Stark

Senha Inválida
    [tags]                          login_error
    Go To                           ${url}/login
    Login With                      stark    abc231
    Should Contain Login Alert      Senha é invalida!

Usuário não existe
    [tags]                          login_user_404
    Go To                           ${url}/login
    Login With                      teste    123456
    Should Contain Login Alert      O usuário informado não está cadastrado!

*** Keywords ***
Login With
    [Arguments]                     ${uname}   ${pass}
    Input Text                      css:input[name=username]        ${uname}
    Input Text                      css:input[name=password]        ${pass}
    Click Element                   class:btn-login

Should Contain Login Alert
    [Arguments]                     ${expected_message}
    ${message}=                     Get WebElement                  id:flash
    Should Contain                  ${message.text}                 ${expected_message}

Should See Logged User
    [Arguments]                     ${logged_user}
    Page Should Contain             Olá, ${logged_user}. Você acessou a área logada!
