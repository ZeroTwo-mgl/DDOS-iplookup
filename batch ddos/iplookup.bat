:ipt
@echo off
chcp 65001 >nul
title Ip lookup By zero two mgl
color d
mode 
setlocal ENABLEDELAYEDEXPANSION
set webclient=webclient
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul
cls 
color 
cls
type logo.py
set /p user=Enter username:
echo.
set /p pass=Enter password:
if %user% == root if %pass% == root goto main
echo Mot de passe ou nom d'utilisateur incorrecte...
timeout 3 >nul
goto again
:main
set /p main=Appuyez sur Entrée
cls
type logo.py
echo.
goto action
:action
echo.
echo [1]- test iplookup             [2]- enter IP 
echo.
set /p action=Choose option : 
if '%action%'=='1' echo sUrl = "http://ipinfo.io/json" > %temp%\%webclient%.vbs & goto localip
if '%action%'=='2' goto iplookup
if '%action%'=='3' goto tool
goto 
:iplookup
mode con lines=15 cols=60
cls
echo.
echo.
set ip=127.0.0.1
set /p ip=SKIDS IP # 
echo sUrl = "http://ipinfo.io/%ip%/json" > %temp%\%webclient%.vbs
:localip
cls
echo set oHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0") >> %temp%\%webclient%.vbs
echo oHTTP.open "GET", sUrl,false >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded" >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Length", Len(sRequest) >> %temp%\%webclient%.vbs
echo oHTTP.send sRequest >> %temp%\%webclient%.vbs
echo HTTPGET = oHTTP.responseText >> %temp%\%webclient%.vbs
echo strDirectory = "%temp%\response.txt" >> %temp%\%webclient%.vbs
echo set objFSO = CreateObject("Scripting.FileSystemObject") >> %temp%\%webclient%.vbs
echo set objFile = objFSO.CreateTextFile(strDirectory) >> %temp%\%webclient%.vbs
echo objFile.Write(HTTPGET) >> %temp%\%webclient%.vbs
echo objFile.Close >> %temp%\%webclient%.vbs
echo Wscript.Quit >> %temp%\%webclient%.vbs
start %temp%\%webclient%.vbs
set /a requests=0
echo.
echo  Tracking IP Address. . .
:checkresponseexists
set /a requests=%requests% + 1
if %requests% gtr 7 goto failed
IF EXIST "%temp%\response.txt" (
goto response_exist
) ELSE (
ping 127.0.0.1 -n 2 -w 1000 >nul
goto checkresponseexists
)
:failed
taskkill /f /im wscript.exe >nul
del "%temp%\%webclient%.vbs" /f /q /s >nul
echo.
echo Did not receive a response from the API.
echo.
pause
goto ipt
:response_exist
cls
echo.
for /f "delims=     " %%i in ('findstr /i "ip hostname city region country loc org postal" %temp%\response.txt') do (
    set data=%%i
    set data=!data:,=!
    set data=!data:""=Not Listed!
    set data=!data:"=!  
        set data=!data:ip:=IP:   !
    set data=!data:hostname:=Hostname:   !
    set data=!data:city:=City:   !
    set data=!data:region:=State:   !
    set data=!data:country:=Country:   !
    set data=!data:loc:=Location:   !
    set data=!data:org:=ISP:   !
    set data=!data:postal:=Postal:   !
        echo !data!
)
echo.
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul
pause
echo Voulez vous quitter le logiciel ? (Y/N)
set /p choix=
if %choix%==Y exit
if %choix%==y exit
if %choix%==N goto:Start
if %choix%==n goto:Start
if '%ip%'=='' goto ipt
goto ipt
exit