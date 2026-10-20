@echo off
setlocal EnableExtensions EnableDelayedExpansion
title ESPRED
mode con: cols=78 lines=30
color 0B

:menu
cls
echo.
echo   ================================================================
echo.
echo                 E S P R E D
echo                 Loot Chance Simulator
echo.
echo   ================================================================
echo.
echo   SELECT MAP
echo.
echo     [1] Farm
echo     [2] Valley
echo     [3] Northridge
echo     [4] TV Station
echo     [5] Airport
echo     [6] Armory
echo.
set "map="
set /p "mapChoice=  Enter map number: "

if "%mapChoice%"=="1" set "map=Farm"
if "%mapChoice%"=="2" set "map=Valley"
if "%mapChoice%"=="3" set "map=Northridge"
if "%mapChoice%"=="4" set "map=TV Station"
if "%mapChoice%"=="5" set "map=Airport"
if "%mapChoice%"=="6" set "map=Armory"

if not defined map (
    echo.
    echo   Invalid choice. Please select a number from 1 to 6.
    timeout /t 2 /nobreak >nul
    goto menu
)

:difficulty
cls
echo.
echo   ================================================================
echo                 E S P R E D
echo   ================================================================
echo.
echo   Selected map: %map%
echo.
echo   SELECT DIFFICULTY
echo.
echo     [1] Yellow
echo     [2] White
echo     [3] Red
echo.
set "difficulty="
set /p "difficultyChoice=  Enter difficulty number: "

if "%difficultyChoice%"=="1" (
    set "difficulty=Yellow"
    set "redChance=21%"
    set "yellowChance=96%"
)
if "%difficultyChoice%"=="2" (
    set "difficulty=White"
    set "redChance=6.4%"
    set "yellowChance=41%"
)
if "%difficultyChoice%"=="3" (
    set "difficulty=Red"
    set "redChance=48%"
    set "yellowChance=100%"
)

if not defined difficulty (
    echo.
    echo   Invalid choice. Please select 1, 2, or 3.
    timeout /t 2 /nobreak >nul
    goto difficulty
)

:confirm
cls
echo.
echo   ================================================================
echo                 E S P R E D
echo   ================================================================
echo.
echo   Map:        %map%
echo   Difficulty: %difficulty%
echo.
choice /c YN /n /m "  Confirm selection? [Y] Yes  [N] No: "
if errorlevel 2 goto menu

cls
timeout /t 10 /nobreak >nul

cls
echo.
echo   ================================================================
echo                 E S P R E D
echo   ================================================================
echo.
echo   Map:        %map%
echo   Difficulty: %difficulty%
echo.
echo   LOOT CHANCES
echo.
echo   Red item:    %redChance%
echo   Yellow item: %yellowChance%
echo.
echo   ================================================================
echo.
echo   [R] Run again     [Q] Quit
choice /c RQ /n /m "  Select: "
if errorlevel 2 goto end
goto menu

:end
endlocal
exit /b
