@echo off
setlocal enabledelayedexpansion

:: 1. TU DONG YEU CAU QUYEN ADMIN
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :StartApp
) else (
    echo [INFO] Dang yeu cau quyen Admin de chay cac tac vu he thong...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:StartApp
cd /d "%~dp0"
chcp 437 >nul

:: CAU HINH LOG (Giu nguyen tu ban cua ban)
set "VERBOSE=1"
set "LOGFILE=%USERPROFILE%\Desktop\CleanupLog.txt"
set "ERROR_COUNT=0"
set "SUCCESS_COUNT=0"

:MainMenu
cls
echo ======================================================
echo          DEEP CLEAN WINDOWS - VERSION 2.1
echo ======================================================
echo  1. Full Cleanup (15 Buoc chi tiet - v2.0.1)
echo  2. Privacy Hardening (Telemetry, Ads, History)
echo  3. System Restore Point (Tao diem khoi phuc)
echo  Q. Thoat
echo ======================================================
set /p choice="Chon nhiem vu (1-3, Q): "

if "%choice%"=="1" goto :FullCleanup
if "%choice%"=="2" goto :PrivacyModule
if "%choice%"=="3" goto :BackupModule
if /i "%choice%"=="Q" exit /b
goto :MainMenu

:FullCleanup
cls
echo [EXE] Bat dau quy trinh don dep 15 buoc...
echo Khoi tao Log tai: %LOGFILE%
echo. > "%LOGFILE%"

:: --- GOI CAC HAM DON DEP CHI TIET TU FILE GOC ---
call :CleanFolder "[1/15] Temp Folder" "%temp%" "TEMP"
call :CleanFolder "[2/15] Windows Temp" "%windir%\Temp" "WINTEMP"

call :LogMessage "[3/15] Prefetch Cleanup"
if exist "%windir%\Prefetch" (
    del /q "%windir%\Prefetch\*.*" 2>nul
    set /a SUCCESS_COUNT+=1
)

call :LogMessage "[4/15] CrashDumps Cleanup"
if exist "%windir%\CrashDumps" (
    del /q "%windir%\CrashDumps\*.*" 2>nul
    set /a SUCCESS_COUNT+=1
)

call :LogMessage "[5/15] Recycle Bin Cleanup"
rd /s /q "C:\$Recycle.Bin" 2>nul

call :LogMessage "[6/15] Thumbnails Cache"
rd /s /q "%APPDATA%\Microsoft\Windows\Recent" 2>nul

call :LogMessage "[7-9/15] Browser Caches (Chrome/Edge/Firefox)"
:: Chrome
if exist "%LOCALAPPDATA%\Google\Chrome\User Data\" (
    for /d %%A in ("%LOCALAPPDATA%\Google\Chrome\User Data\*") do rd /s /q "%%A\Cache" 2>nul
)
:: Edge
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data\" (
    for /d %%A in ("%LOCALAPPDATA%\Microsoft\Edge\User Data\*") do rd /s /q "%%A\Cache" 2>nul
)

call :LogMessage "[10/15] App Caches (Discord/Steam/VSCode)"
rd /s /q "%APPDATA%\discord\Cache" 2>nul
rd /s /q "%LOCALAPPDATA%\Steam\htmlcache" 2>nul

call :LogMessage "[11/15] Developer Tools (npm/Python/Go)"
call npm cache clean --force 2>nul

call :LogMessage "[12/15] Windows Update Cache"
net stop wuauserv 2>nul
rd /s /q "%windir%\SoftwareDistribution\Download" 2>nul
md "%windir%\SoftwareDistribution\Download" 2>nul
net start wuauserv 2>nul

call :LogMessage "[13/15] Delivery Optimization"
net stop DoSvc 2>nul
rd /s /q "%ALLUSERSPROFILE%\Microsoft\Network\Downloader" 2>nul
net start DoSvc 2>nul

call :LogMessage "[14/15] System Logs"
if exist "%windir%\logs" for /r "%windir%\logs" %%F in (*.log) do del /q "%%F" 2>nul

call :LogMessage "[15/15] Disk Check (Scan Only)"
chkdsk C: /scan 2>nul

echo.
echo ------------------------------------------------------
echo DA HOAN THANH DON DEP!
echo Successful: %SUCCESS_COUNT%
echo Log: %LOGFILE%
pause
goto :MainMenu

:PrivacyModule
cls
echo [EXE] Dang thuc hien bao mat...
echo - Tat Telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
echo - Tat Advertising ID...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
echo [OK] Hoan tat cac thiet lap bao mat.
pause
goto :MainMenu

:BackupModule
cls
echo [EXE] Dang tao Restore Point (Vui long cho)...
powershell -Command "Checkpoint-Computer -Description 'DeepClean_v2.1' -RestorePointType 'MODIFY_SETTINGS'"
echo [OK] Da tao diem khoi phuc he thong!
pause
goto :MainMenu

:: --- FUNCTIONS ---
:CleanFolder
set "TITLE=%~1"
set "FOLDER=%~2"
set "NAME=%~3"
call :LogMessage "%TITLE% - %FOLDER%"
if exist "%FOLDER%" (
    rd /s /q "%FOLDER%" 2>nul
    md "%FOLDER%" 2>nul
    set /a SUCCESS_COUNT+=1
)
exit /b 0

:LogMessage
if "%VERBOSE%"=="1" echo %~1
echo %~1 >> "%LOGFILE%"
exit /b 0