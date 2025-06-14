@echo off
echo ========================================
echo Azure AI Demos - Quick Setup
echo ========================================
echo.

REM Check if PowerShell is available
powershell -Command "Get-Host" >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: PowerShell is not available on this system.
    echo Please install PowerShell or run the manual setup.
    pause
    exit /b 1
)

echo Starting PowerShell setup script...
echo.

REM Run the PowerShell setup script
powershell -ExecutionPolicy Bypass -File "%~dp0setup.ps1"

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo Setup completed successfully!
    echo ========================================
    echo.
    echo Next steps:
    echo 1. Edit the .env file with your Azure credentials
    echo 2. Open VS Code or Jupyter in this directory
    echo 3. Start with 01_Azure_AI_Language_Services.ipynb
    echo.
) else (
    echo.
    echo ========================================
    echo Setup failed!
    echo ========================================
    echo.
    echo Please check the README.md for manual setup instructions
    echo or run setup.ps1 directly for more detailed error messages.
    echo.
)

echo Press any key to continue...
pause >nul
