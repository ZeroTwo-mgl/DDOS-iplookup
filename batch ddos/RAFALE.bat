mode
:ping ss
@echo off
chcp 65001 >nul
:again
cls
color 5
title Rafale (Coded by 𓆩 !"Zero Two mgl#1364)
echo Welcome !
echo.
type logo.py
set /p user=Enter username:
echo.
set /p pass=Enter password:
if %user% == root if %pass% == root goto main
echo Mot de passe ou nom d'utilisateur incorrecte...
timeout 3 >nul
goto again
:main
cls
type logo.py
echo                                               Creator : Zero Two mgl
echo.                                        ╔══════════════════════════════════╗
echo                                            Welcome To Rafale Multi tools 
echo.                                        ╚══════════════════════════════════╝

echo                                               ╔═════════════════════╗
echo                                                  [1]- Ip ddos
echo                                                  [2]- Ip lookup
echo                                                  [3]- Information
echo                                               ╚═════════════════════╝

:mainlogo
echo ------------------------------------------------------------------------------------------------------------------------
                                   set /p main=Input your choice [1/3] :

if %main% == 1 ddos.bat
if %main% == 2 iplookup.bat
if %main% == 3 info.bat



                                                         

                                                         

