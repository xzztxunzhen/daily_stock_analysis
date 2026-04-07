@echo off

:: Daily Stock Analysis - WebUI Startup Script
:: Function: One-click start Web interface service
:: Author: daily_stock_analysis

set "SCRIPT_DIR=%~dp0"
set "PYTHON_EXE=python"
set "MAIN_SCRIPT=%SCRIPT_DIR%main.py"

:: Check if Python is installed
where %PYTHON_EXE% >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: Python interpreter not found
    echo Please install Python 3.8+ and add to environment variables
    pause
    exit /b 1
)

:: Check if main.py exists
if not exist "%MAIN_SCRIPT%" (
    echo Error: main.py file not found
    echo Please make sure this script is run in the project root directory
    pause
    exit /b 1
)

:: Display startup information
echo ===========================================
echo Starting Daily Stock Analysis - WebUI
echo ===========================================
echo Run directory: %SCRIPT_DIR%
echo Start command: %PYTHON_EXE% %MAIN_SCRIPT% --serve-only
echo ===========================================
echo Starting Web service...
echo Please wait...
echo ===========================================

:: Start Web service
start "DSA WebUI" /B %PYTHON_EXE% "%MAIN_SCRIPT%" --serve-only

:: Wait for service to start
echo Waiting for service to start...
timeout /t 3 /nobreak >nul

:: Open browser to access Web UI
echo Opening browser...
start http://localhost:8004

:: Wait for user input
echo Press any key to exit...
pause