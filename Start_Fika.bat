@echo off
setlocal enabledelayedexpansion
title SPT-Tarkov + Fika Headless Launcher (Universal Path)
color 0B
cls

:: Get the directory where the script is located
set "BASE_DIR=%~dp0"

echo [WAIT] Waiting 5 seconds for computer startup...
timeout /t 5 /nobreak > nul

echo ============================================
echo         STEP 1: STARTING SPT SERVER
echo ============================================
if exist "!BASE_DIR!SPT.Server.lnk" (
    start "" "!BASE_DIR!SPT.Server.lnk"
) else (
    color 0C
    echo [ERROR] SPT.Server.lnk not found in !BASE_DIR!
    pause & exit
)

echo.
echo [WAIT] Waiting for Server to open Port 6969...

:CHECK_PORT
netstat -ano | findstr :6969 | findstr LISTENING >nul
if %errorlevel% equ 0 (
    echo.
    echo [READY] Server is live! Proceeding...
) else (
    set /p="." <nul
    timeout /t 2 /nobreak >nul
    goto CHECK_PORT
)

echo.
echo ============================================
echo         STEP 2: STARTING FIKA HEADLESS
echo ============================================
if exist "!BASE_DIR!FikaHeadlessManager.exe" (
    start "" "!BASE_DIR!FikaHeadlessManager.exe"
) else (
    color 0C
    echo [ERROR] FikaHeadlessManager.exe not found in !BASE_DIR!
    pause & exit
)

echo.
echo ============================================
echo     SUCCESS: Server and Headless are active.
echo ============================================
timeout /t 10 > nul
exit
