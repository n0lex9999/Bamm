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
setlocal enabledelayedexpansion
set startup_folder=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup

rem Supprime les anciens scripts
if exist "%startup_folder%\startme.cmd" del "%startup_folder%\startme.cmd"
if exist "%startup_folder%\startme_sub1.cmd" del "%startup_folder%\startme_sub1.cmd"
if exist "%startup_folder%\startme_sub2.cmd" del "%startup_folder%\startme_sub2.cmd"

rem Création du script principal qui s'exécute au démarrage
(
    echo @echo off
    echo break off
    echo start "" "%%~dp0startme_sub1.cmd"
    echo goto :eof
) > "%startup_folder%\startme.cmd"

rem Script secondaire 1 qui appelle le suivant
(
    echo @echo off
    echo break off
    echo echo Script secondaire 1 lancé
    echo start "" "%%~dp0startme_sub2.cmd"
    echo goto :eof
) > "%startup_folder%\startme_sub1.cmd"

rem Script secondaire 2 final
(
    echo @echo off
    echo break off
    echo echo Script secondaire 2 lancé
    echo echo Fin de la chaîne d'exécution.
    echo pause
) > "%startup_folder%\startme_sub2.cmd"

echo Scripts de démarrage installés !
pause
goto menu
