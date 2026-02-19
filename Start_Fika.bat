@echo off
title SPT-Tarkov + Fika Headless Launcher (Smart Check)
color 0B
cls

echo [WAIT] Waiting 5 seconds for computer startup...
timeout /t 5 /nobreak > nul

echo ============================================
echo       STEP 1: STARTING SPT SERVER
echo ============================================
if exist "C:\Games\SPT\SPT.Server.lnk" (
    start "" "C:\Games\SPT\SPT.Server.lnk"
) else (
    color 0C
    echo [ERROR] SPT.Server.lnk not found!
    pause & exit
)

echo.
echo [WAIT] Waiting for Server to open Port 6969...

:CHECK_PORT
:: 'netstat' looks for the port, 'findstr' filters for the "LISTENING" state
netstat -ano | findstr :6969 | findstr LISTENING >nul
if %errorlevel% equ 0 (
    echo [READY] Server is live! Proceeding...
) else (
    :: Visual feedback so you know the script hasn't frozen
    set /p="." <nul
    timeout /t 2 /nobreak >nul
    goto CHECK_PORT
)

echo.
echo ============================================
echo       STEP 2: STARTING FIKA HEADLESS
echo ============================================
if exist "C:\Games\SPT\FikaHeadlessManager.lnk" (
    start "" "C:\Games\SPT\FikaHeadlessManager.lnk"
) else (
    color 0C
    echo [ERROR] FikaHeadlessManager.lnk not found!
    pause & exit
)

echo.
echo ============================================
echo    SUCCESS: Server and Headless are active.
echo ============================================
timeout /t 10 > nul
exit
