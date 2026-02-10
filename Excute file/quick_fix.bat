@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

REM ==========================================
REM QUICK FIX - Fix lỗi common
REM ==========================================

title QUICK FIX - Common Issues

echo.
echo ╔════════════════════════════════════════════════╗
echo ║         QUICK FIX - Fix Common Issues         ║
echo ╚════════════════════════════════════════════════╝
echo.

REM Check admin
whoami /priv | find "SeDebugPrivilege" >nul
if errorlevel 1 (
    echo ⚠️ Admin required! Right-click ^> Run as Administrator
    pause
    exit /b 1
)

echo Choose which issue to fix:
echo.
echo [1] Close all Chrome/Edge/Firefox (locked cache)
echo [2] Kill stuck processes
echo [3] Fix "Access Denied" on folders
echo [4] Enable UAC (for admin check)
echo [5] Stop Windows Update service
echo [6] Clear ONE browser cache only
echo [7] Check disk space before/after cleanup
echo [8] Exit
echo.

set /p CHOICE="Enter choice (1-8): "

if "%CHOICE%"=="1" goto CLOSEAPPS
if "%CHOICE%"=="2" goto KILLPROCESS
if "%CHOICE%"=="3" goto FIXACCESS
if "%CHOICE%"=="4" goto ENABLEUAC
if "%CHOICE%"=="5" goto STOPWU
if "%CHOICE%"=="6" goto CLEANBROWSER
if "%CHOICE%"=="7" goto CHECKDISK
if "%CHOICE%"=="8" exit /b 0

echo Invalid choice!
pause
goto START

:CLOSEAPPS
echo.
echo Closing all browsers...
taskkill /IM chrome.exe /F 2>nul
taskkill /IM msedge.exe /F 2>nul
taskkill /IM firefox.exe /F 2>nul
echo ✓ Done!
timeout /t 2
goto START

:KILLPROCESS
echo.
echo Task Manager will open to kill stuck processes.
echo Close any process that's "Using" the files you need to delete.
echo.
pause
tasklist
echo.
echo Example: taskkill /IM [processname].exe /F
echo.
set /p PROC="Enter process name to kill (or press Enter to skip): "
if not "!PROC!"=="" (
    taskkill /IM !PROC!.exe /F 2>nul
    if errorlevel 0 (
        echo ✓ Process killed
    ) else (
        echo ✗ Process not found
    )
)
timeout /t 2
goto START

:FIXACCESS
echo.
echo Trying to fix access denied issues...
echo.

echo [1] Fix TEMP folder permissions
icacls "%TEMP%" /grant:r "%USERNAME%:F" /T /C 2>nul
if errorlevel 0 echo ✓ TEMP fixed

echo [2] Fix Windows Temp permissions
icacls "%windir%\Temp" /grant:r "%USERNAME%:F" /T /C 2>nul
if errorlevel 0 echo ✓ Windows Temp fixed

echo [3] Fix Recycle Bin
takeown /F "C:\$Recycle.Bin" /R /D Y 2>nul
icacls "C:\$Recycle.Bin" /grant:r "%USERNAME%:F" /T /C 2>nul
if errorlevel 0 echo ✓ Recycle Bin fixed

echo.
echo ✓ Permissions should be fixed!
timeout /t 3
goto START

:ENABLEUAC
echo.
echo Opening Security Policy Editor (secpol.msc)...
echo.
echo When window opens:
echo 1. Expand: Local Policies ^> Security Options
echo 2. Find: "User Account Control"
echo 3. Set to: "Always notify"
echo 4. Click OK
echo 5. Restart computer
echo.
pause
secpol.msc
goto START

:STOPWU
echo.
echo Stopping Windows Update service...
net stop wuauserv
echo ✓ Stopped
echo.
echo Note: Service will restart automatically.
echo To prevent cleanup issues:
echo - Stop: net stop wuauserv
echo - Do cleanup
echo - Start: net start wuauserv
echo.
pause
goto START

:CLEANBROWSER
echo.
echo Which browser to clean?
echo [1] Chrome only
echo [2] Edge only
echo [3] Firefox only
echo.
set /p BROWSER="Choice (1-3): "

if "%BROWSER%"=="1" (
    echo Cleaning Chrome only...
    if exist "%APPDATA%\Google\Chrome\User Data\" (
        for /d %%A in ("%APPDATA%\Google\Chrome\User Data\*") do (
            rd /s /q "%%A\Cache" 2>nul
            rd /s /q "%%A\Cache2" 2>nul
        )
        echo ✓ Chrome cache cleaned
    ) else (
        echo ✗ Chrome not found
    )
)

if "%BROWSER%"=="2" (
    echo Cleaning Edge only...
    if exist "%APPDATA%\Microsoft\Edge\User Data\" (
        for /d %%A in ("%APPDATA%\Microsoft\Edge\User Data\*") do (
            rd /s /q "%%A\Cache" 2>nul
            rd /s /q "%%A\Cache2" 2>nul
        )
        echo ✓ Edge cache cleaned
    ) else (
        echo ✗ Edge not found
    )
)

if "%BROWSER%"=="3" (
    echo Cleaning Firefox only...
    if exist "%APPDATA%\Mozilla\Firefox\Profiles\" (
        for /d %%A in ("%APPDATA%\Mozilla\Firefox\Profiles\*") do (
            del /q "%%A\cache\*.*" 2>nul
            del /q "%%A\cache2\entries\*.*" 2>nul
        )
        echo ✓ Firefox cache cleaned
    ) else (
        echo ✗ Firefox not found
    )
)

timeout /t 3
goto START

:CHECKDISK
echo.
echo Disk space before cleanup:
echo.
for /f "tokens=3" %%A in ('dir C:\ ^| find "bytes free"') do (
    echo Free space: %%A bytes
)
echo.
echo Run cleanup scripts now, then come back here.
echo Press Enter when done...
pause
echo.
echo Disk space AFTER cleanup:
echo.
for /f "tokens=3" %%A in ('dir C:\ ^| find "bytes free"') do (
    echo Free space: %%A bytes
)
echo.
echo Compare numbers above to see how much was freed!
timeout /t 5
goto START

:START
cls
echo.
echo ╔════════════════════════════════════════════════╗
echo ║         QUICK FIX MENU                        ║
echo ╚════════════════════════════════════════════════╝
echo.
echo [1] Close all browsers (fix locked cache)
echo [2] Kill stuck processes (process manager)
echo [3] Fix "Access Denied" errors
echo [4] Enable UAC (for admin requirements)
echo [5] Stop Windows Update service
echo [6] Clean ONE browser cache
echo [7] Check disk space before/after
echo [8] Exit
echo.
set /p CHOICE="Enter choice (1-8): "

if "%CHOICE%"=="1" goto CLOSEAPPS
if "%CHOICE%"=="2" goto KILLPROCESS
if "%CHOICE%"=="3" goto FIXACCESS
if "%CHOICE%"=="4" goto ENABLEUAC
if "%CHOICE%"=="5" goto STOPWU
if "%CHOICE%"=="6" goto CLEANBROWSER
if "%CHOICE%"=="7" goto CHECKDISK
if "%CHOICE%"=="8" exit /b 0

echo Invalid choice!
timeout /t 2
goto START