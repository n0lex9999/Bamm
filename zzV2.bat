@echo off
chcp 65001 > nul
break off

:menu
cls
echo	██████╗  ██████╗ ██╗   ██╗██╗     ███████╗████████╗████████╗███████╗    ██████╗ ██╗   ██╗███████╗███████╗███████╗
echo	██╔══██╗██╔═══██╗██║   ██║██║     ██╔════╝╚══██╔══╝╚══██╔══╝██╔════╝    ██╔══██╗██║   ██║██╔════╝██╔════╝██╔════╝
echo	██████╔╝██║   ██║██║   ██║██║     █████╗     ██║      ██║   █████╗      ██████╔╝██║   ██║███████╗███████╗█████╗  
echo	██╔══██╗██║   ██║██║   ██║██║     ██╔══╝     ██║      ██║   ██╔══╝      ██╔══██╗██║   ██║╚════██║╚════██║██╔══╝  
echo	██║  ██║╚██████╔╝╚██████╔╝███████╗███████╗   ██║      ██║   ███████╗    ██║  ██║╚██████╔╝███████║███████║███████╗
echo	╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝
echo 						=============================
echo 								[A]
echo.
echo									Ou
echo.
echo									[B] 
echo 						=============================
set /p choice=Choix : 

if /I "%choice%"=="A" goto chance
if /I "%choice%"=="B" goto startup

goto menu

:chance
echo Tu as de la Chance
pause
goto menu

:startup
set "startup_folder=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"

rem Supprime ancien fichier s’il existe
del /f /q "%startup_folder%\startme.bat" > nul 2>&1

rem Crée le fichier de démarrage
(
    echo @echo off
    echo start "" cmd /c "%startup_folder%\sub1.bat"
) > "%startup_folder%\startme.bat"

rem Script sub1
(
    echo @echo off
    echo echo Sub1 lancé
    echo start "" cmd /c "%startup_folder%\sub2.bat"
    echo timeout /t 2 > nul
) > "%startup_folder%\sub1.bat"

rem Script sub2
(
    echo @echo off
    echo echo Sub2 lancé
    echo start "" cmd /c "%startup_folder%\sub3.bat"
    echo timeout /t 2 > nul
) > "%startup_folder%\sub2.bat"

rem Script sub3
(
    echo @echo off
    echo echo Sub3 lancé
    echo start "" cmd /c "%startup_folder%\sub4.bat"
    echo timeout /t 2 > nul
) > "%startup_folder%\sub3.bat"

rem Dernier script (sub4)
(
    echo @echo off
    echo echo BOUM ! Arborescence terminée
    echo pause
) > "%startup_folder%\sub4.bat"

echo Scripts de démarrage installés !
pause
goto menu
