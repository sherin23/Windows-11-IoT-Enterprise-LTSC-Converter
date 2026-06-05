@echo off
title Windows 11 IoT Enterprise LTSC 2024 Conversion
color 0A

echo ============================================
echo Windows 11 IoT Enterprise LTSC 2024 Setup
echo ============================================
echo.

:: Check for Administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Please run this batch file as Administrator.
    pause
    exit
)

:: Set source and destination paths
set "SOURCE=%~dp0IoTEnterpriseS"
set "DEST=C:\Windows\System32\spp\tokens\skus\IoTEnterpriseS"

echo Copying SKU folder...
if exist "%SOURCE%" (
    xcopy "%SOURCE%" "%DEST%" /E /H /C /I /Y
) else (
    echo [ERROR] IoTEnterpriseS folder not found next to this BAT file.
    pause
    exit
)

echo.
echo Running licensing reset commands...
cd /d C:\Windows\System32\spp\tokens\skus

cscript.exe %windir%\system32\slmgr.vbs /rilc
cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ipk KBN8V-HFGQ4-MGXVD-347P6-PDQGT

echo.
echo Starting required services...
sc config LicenseManager start= auto
net start LicenseManager

sc config wuauserv start= auto
net start wuauserv

echo.
echo ============================================
echo Conversion process completed.
echo Restart your PC before activation.
echo ============================================

pause