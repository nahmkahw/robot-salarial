*** Settings ***
Documentation                                       ทดสอบข้าราชการ
Library                                             Selenium2Library

*** Variables ***
${DELAY}                                            0
${BACK_MAIN_PAGE}                                   //a[contains(.,"กลับไปหน้าหลัก")]
${username}                                         modlgn_username
${password}                                         modlgn_passwd
${HEADER_H3}                                        xpath=//h3
${ERROR_LEVEL1}                                     ผู้ที่ผลประเมินระดับดีเด่น (คะแนน 90 - 100) จะต้องมีวันลากิจ วันลาป่วย และการมาสาย รวมกันไม่เกิน 5 วัน
${ERROR_LEVEL2}                                     ผู้ที่ผลประเมินระดับดีมาก (คะแนน 80 - 89) จะต้องมีวันลากิจ วันลาป่วย และการมาสาย รวมกันไม่เกิน 10 วัน
${ERROR_LEVEL3}                                     ผู้ที่ผลประเมินระดับดี (คะแนน 70 - 79) จะต้องมีวันลากิจ วันลาป่วย และการมาสาย รวมกันไม่เกิน 15 วัน
${ERROR_LEVEL4}                                     ผู้ที่ผลประเมินระดับพอใช้ (คะแนน 60 - 69) จะต้องมีวันลากิจ วันลาป่วย และการมาสาย รวมกันไม่เกิน 23 วัน
${ERROR_MORETHAN100}                                คะแนนที่กรอก ต้องไม่เกิน 100 คะแนน
${ERROR_SCORE_EQUAL_SCORETRUE}                      คะแนนผลการประเมินจริง ต้องมากกว่าเท่ากับคะแนนที่กรอก
${ERROR_LAVEL}                                      โปรดระบุ งาน/ฝ่าย/สำนักงาน/ศูนย์/โครงการ/หน่วยงานย่อย
${EMPTY}                                            
${ZERO}                                             0
${DOT}                                              -
${SCORE}                                            s873
${SCORE_VALUE}                                      98
${SCORE_MORETHAN100_VALUE}                          101
${SCORETRUE}                                        scoretrue873
${LATED}                                            lated873
${ABSENCE}                                          ab873
${ABSENCE_VALUE}                                    1
${ABSENCE_OVERLEVEL1_VALUE}                         6
${ABSENCE_OVERLEVEL2_VALUE}                         11
${ABSENCE_OVERLEVEL3_VALUE}                         16
${ABSENCE_OVERLEVEL4_VALUE}                         24
${JOB}                                              job873
${JOB_VALUE}                                        งานพัฒนาระบบ
*** Test case ***
เข้าสู่ระบบ
    [Documentation]                                 ผู้ใช้ต้องเข้าสู่ระบบได้
    open browser                                    http://localhost/home   chrome
    Maximize Browser Window
    wait until page contains                        เข้าสู่ระบบ
    Set Selenium Speed  ${DELAY}
ทดสอบข้าราชการ
    [Documentation]                                 ทดสอบข้าราชการ
    Input Text  ${username}                         V-9999
    Input Text  ${password}                         hugghugg
    Click Element                                   id:Login
    wait until page contains                        ข้าราชการ
ออกจากระบบ
    Click Element                                   xpath=//input[@value='BUTTON_LOGOUT']
    wait until page contains                        เข้าสู่ระบบ
    [Teardown]                                      Close Browser

*** Keywords ***
Set Environment Variable  webdriver.gecko.driver    /usr/local/bin/gekodriver
Start Test Offcial
    Click Element                                   //a[contains(.,"ข้าราชการ")]
    wait until page contains                        บันทึกผลประเมิน
    Click Element                                   xpath=//select[@id='ftype']
    Click Element                                   xpath=//option[@value='1']
    wait until page contains                        วรานนท์ คงสง
    Click Element                                   //a[contains(.,"กรอกคะแนนผลการประเมิน")]
    wait until page contains                        วรานนท์ คงสง
Default Value
    Input Text  ${SCORE}                            ${ZERO}
    Click Element                                   ${HEADER_H3}
    Input Text  ${SCORETRUE}                        ${ZERO}
    Click Element                                   ${HEADER_H3}
    Input Text  ${LATED}                            ${ZERO}
    Click Element                                   ${HEADER_H3}
    Input Text  ${ABSENCE}                          ${ZERO}
    Click Element                                   ${HEADER_H3}
    Input Text  ${JOB}                              ${DOT}
    Click Element                                   ${HEADER_H3}
Test Score
    Input Text  ${SCORE}                            ${SCORE_VALUE}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_SCORE_EQUAL_SCORETRUE}
    Input Text  ${SCORE}                            ${SCORE_VALUE}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_MORETHAN100}
    Input Text  ${SCORE}                            ${SCORE_MORETHAN100_VALUE}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_MORETHAN100}

Test Absence
    Input Text  ${ABSENCE}                          ${ABSENCE_VALUE}
    Click Element                                   ${HEADER_H3}
    Input Text  ${SCORE}                            ${SCORE_VALUE}
    Click Element                                   ${HEADER_H3}
    Input Text  ${ABSENCE}                          ${ABSENCE_OVERLEVEL1_VALUE}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_LEVEL1}
    Click Element                                   ${HEADER_H3}

    Input Text  ${ABSENCE}                          ${ABSENCE_VALUE}
    Click Element                                   ${HEADER_H3}
    Input Text  ${SCORE}                            ${SCORE_VALUE}
    Click Element                                   ${HEADER_H3}
    Input Text  ${ABSENCE}                          ${ABSENCE_OVERLEVEL2_VALUE}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_LEVEL1}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_LEVEL2}
    Click Element                                   ${HEADER_H3}

    Input Text  ${ABSENCE}                          ${ABSENCE_VALUE}
    Click Element                                   ${HEADER_H3}
    Input Text  ${SCORE}                            ${SCORE_VALUE}
    Click Element                                   ${HEADER_H3}
    Input Text  ${ABSENCE}                          ${ABSENCE_OVERLEVEL3_VALUE}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_LEVEL1}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_LEVEL2}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_LEVEL3}
    Click Element                                   ${HEADER_H3}

    Input Text  ${ABSENCE}                          ${ABSENCE_VALUE}
    Click Element                                   ${HEADER_H3}
    Input Text  ${SCORE}                            ${SCORE_VALUE}
    Click Element                                   ${HEADER_H3}
    Input Text  ${ABSENCE}                          ${ABSENCE_OVERLEVEL4_VALUE}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_LEVEL1}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_LEVEL2}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_LEVEL3}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_LEVEL4}
    Click Element                                   ${HEADER_H3}
Test Score True
    Input Text  ${SCORETRUE}                        ${SCORE_VALUE}
    Click Element                                   ${HEADER_H3}
    Input Text  ${SCORETRUE}                        ${SCORE_MORETHAN100_VALUE}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_MORETHAN100}
Test Job
    Input Text  ${JOB}                              ${EMPTY}
    Click Element                                   ${HEADER_H3}
    wait until page contains                        ${ERROR_LAVEL}
    Input Text  ${JOB}                              ${DOT}
    Click Element                                   ${HEADER_H3}
    Input Text  ${JOB}                              ${JOB_VALUE}
Back Main Page
    Click Element                                   ${HEADER_H3}
    Click Element                                   ${BACK_MAIN_PAGE}