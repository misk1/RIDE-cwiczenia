*** Settings ***
Library           OperatingSystem
Library           Collections

*** Test Cases ***
operacje
    ${wynik}    dzielenie    10    5
    ${wynik}    dzielenie    45    0
    ${wynik}    dodawanie    34    7
    ${minX}    minimum    23    54    12    43    26
    ...    29    18    7    182
    ${maxX}    maximum    23    54    12    43    26
    ...    29    18    7    182
    ${suma}    sumowanie    1    2    3    4    5
    ...    6    7    8    9    10
    ${average}    srednia    2    3    4    2    3
    ...    4    2    3    4    2    3
    ...    4

*** Keywords ***
dzielenie
    [Arguments]    ${liczba1}    ${liczba2}
    ${wynik}    Run Keyword If    ${liczba2} != 0    Evaluate    ${liczba1} / ${liczba2}
    ...    ELSE IF    ${liczba2} == 0    LOG    Nie dziel przez zero
    [Return]    ${wynik}

dodawanie
    [Arguments]    ${arg1}    ${arg2}
    ${wynik}    Evaluate    ${arg1} + ${arg2}
    [Return]    ${wynik}

minimum
    [Arguments]    @{x}
    ${minX}=    Get from list    ${x}    0
    : FOR    ${i}    IN    @{x}
    \    ${minX}=    Set Variable If    ${minX} > ${i}    ${i}    ${minX}
    [Return]    ${minX}

maximum
    [Arguments]    @{x}
    ${maxX}=    Get from list    ${x}    0
    : FOR    ${i}    IN    @{x}
    \    ${maxX}=    Set Variable If    ${maxX} < ${i}    ${i}    ${maxX}
    [Return]    ${maxX}

sumowanie
    [Arguments]    @{x}
    ${suma}=    Set Variable    0
    : FOR    ${i}    IN    @{x}
    \    ${suma}    Evaluate    ${suma} + ${i}
    [Return]    ${suma}

srednia
    [Arguments]    @{x}
    ${suma} =    Set Variable    0
    ${len} =    Get Length    ${x}
    : FOR    ${i}    IN    @{x}
    \    ${suma}    Evaluate    ${suma} + ${i}
    ${average}    Evaluate    ${suma} / ${len}
    [Return]    ${average}
