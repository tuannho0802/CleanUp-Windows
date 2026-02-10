@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

REM ==========================================
REM SAFE VERSION - Cleanup an toàn
REM Chỉ xóa basic stuff, không risky
REM ==========================================

set "LOGFILE=%USERPROFILE%\Desktop\CleanupLog_Safe.txt"
set "VERBOSE=1"

REM === ADMIN CHECK ===
whoami /priv | find "SeDebugPrivilege" >nul
if errorlevel 1 (
    echo.
    echo ⚠️ LỖI: Cần quyền Admin!
    echo Vui lòng: Right-click ^> Run as Administrator
    echo.
    pause
    exit /b 1
)

REM === INIT LOG ===
echo. > "%LOGFILE%"
echo ================================================== >> "%LOGFILE%"
echo SAFE CLEANUP - %date% %time% >> "%LOGFILE%"
echo ================================================== >> "%LOGFILE%"

cls
echo.
echo ╔════════════════════════════════════════════════╗
echo ║      SAFE CLEANUP - Xóa cơ bản an toàn       ║
echo ║  (Không xóa developer tools, không scan disk) ║
echo ╚════════════════════════════════════════════════╝
echo.
echo Log: %LOGFILE%
echo.
timeout /t 2 /nobreak

REM === CLEANUP TASKS ===

echo [1/6] Xóa Temp folder...
call :LogMessage "[1/6] Xóa Temp folder"
if exist "%TEMP%" (
    for /d %%A in ("%temp%\*") do rd /s /q "%%A" 2>nul
    del /q "%temp%\*.*" 2>nul
    call :LogMessage "  ✓ Cleaned"
)
timeout /t 1 /nobreak

echo [2/6] Xóa Windows Temp...
call :LogMessage "[2/6] Xóa Windows Temp"
if exist "%windir%\Temp" (
    for /d %%A in ("%windir%\Temp\*") do rd /s /q "%%A" 2>nul
    del /q "%windir%\Temp\*.*" 2>nul
    call :LogMessage "  ✓ Cleaned"
)
timeout /t 1 /nobreak

echo [3/6] Xóa Prefetch...
call :LogMessage "[3/6] Xóa Prefetch"
if exist "%windir%\Prefetch" (
    del /q "%windir%\Prefetch\*.*" 2>nul
    call :LogMessage "  ✓ Cleaned"
)
timeout /t 1 /nobreak

echo [4/6] Xóa Browser Cache (if not running)...
call :LogMessage "[4/6] Xóa Browser Cache"

REM Chrome
if exist "%APPDATA%\Google\Chrome\User Data\" (
    for /d %%A in ("%APPDATA%\Google\Chrome\User Data\*") do (
        rd /s /q "%%A\Cache" 2>nul
        rd /s /q "%%A\Cache2" 2>nul
    )
    call :LogMessage "  ✓ Chrome cache cleaned"
)

REM Edge
if exist "%APPDATA%\Microsoft\Edge\User Data\" (
    for /d %%A in ("%APPDATA%\Microsoft\Edge\User Data\*") do (
        rd /s /q "%%A\Cache" 2>nul
        rd /s /q "%%A\Cache2" 2>nul
    )
    call :LogMessage "  ✓ Edge cache cleaned"
)

REM Firefox
if exist "%APPDATA%\Mozilla\Firefox\Profiles\" (
    for /d %%A in ("%APPDATA%\Mozilla\Firefox\Profiles\*") do (
        del /q "%%A\cache\*.*" 2>nul
        del /q "%%A\cache2\entries\*.*" 2>nul
    )
    call :LogMessage "  ✓ Firefox cache cleaned"
)
timeout /t 1 /nobreak

echo [5/6] Xóa Recycle Bin...
call :LogMessage "[5/6] Xóa Recycle Bin"
rd /s /q "C:\$Recycle.Bin" 2>nul
call :LogMessage "  ✓ Cleaned"
timeout /t 1 /nobreak

echo [6/6] Xóa CrashDumps...
call :LogMessage "[6/6] Xóa CrashDumps"
if exist "%windir%\CrashDumps" (
    for /d %%A in ("%windir%\CrashDumps\*") do rd /s /q "%%A" 2>nul
    del /q "%windir%\CrashDumps\*.*" 2>nul
    call :LogMessage "  ✓ Cleaned"
)
timeout /t 1 /nobreak

REM === DONE ===
echo.
echo ╔════════════════════════════════════════════════╗
echo ║        CLEANUP HOÀN THÀNH!                   ║
echo ║  Log: %LOGFILE%              ║
echo ╚════════════════════════════════════════════════╝
echo.

call :LogMessage ""
call :LogMessage "HOÀN THÀNH - %date% %time%"

pause
exit /b 0

REM === FUNCTIONS ===
:LogMessage
echo %~1 >> "%LOGFILE%"
exit /b 0