
*** Settings ***
Library     app.py

*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=          Welcome     Vinicius
    Should Be Equal     ${result}   Olá Vinicius, bem vindo ao Curso básico de Robot Framework!