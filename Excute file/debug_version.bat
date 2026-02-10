@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

REM ==========================================
REM DEBUG VERSION - Để xem lỗi gì xảy ra
REM ==========================================

title DEBUG - Deep Clean Windows

echo.
echo ╔════════════════════════════════════════════════╗
echo ║     DEBUG MODE - Xem lỗi chi tiết            ║
echo ╚════════════════════════════════════════════════╝
echo.

REM === KIỂM TRA ADMIN ===
echo [DEBUG] Kiểm tra quyền admin...
whoami /priv | find "SeDebugPrivilege" >nul
if errorlevel 1 (
    echo ✗ LỖI: Không có quyền Admin!
    echo.
    echo Vui lòng:
    echo 1. Right-click file .bat này
    echo 2. Chọn "Run as Administrator"
    echo 3. Click "Yes" ở UAC dialog
    echo.
    pause
    exit /b 1
)
echo ✓ Admin check: PASSED

REM === KIỂM TRA TỪNG THƯ MỤC ===
echo.
echo [DEBUG] Kiểm tra thư mục tồn tại...

REM Temp folders
if exist "%TEMP%" (
    echo ✓ %%TEMP%% = %TEMP% (EXISTS)
) else (
    echo ✗ %%TEMP%% KHÔNG TỒN TẠI!
)

if exist "%windir%\Temp" (
    echo ✓ Windows Temp = %windir%\Temp (EXISTS)
) else (
    echo ✗ Windows Temp KHÔNG TỒN TẠI!
)

REM Browser folders
if exist "%APPDATA%\Google\Chrome" (
    echo ✓ Chrome = %APPDATA%\Google\Chrome (EXISTS)
) else (
    echo ✗ Chrome KHÔNG TỒN TẠI
)

if exist "%APPDATA%\Microsoft\Edge" (
    echo ✓ Edge = %APPDATA%\Microsoft\Edge (EXISTS)
) else (
    echo ✗ Edge KHÔNG TỒN TẠI
)

if exist "%APPDATA%\Mozilla\Firefox" (
    echo ✓ Firefox = %APPDATA%\Mozilla\Firefox (EXISTS)
) else (
    echo ✗ Firefox KHÔNG TỒN TẠI
)

REM === KIỂM TRA COMMANDS ===
echo.
echo [DEBUG] Kiểm tra commands có sẵn...

echo Checking npm...
npm -v >nul 2>&1
if errorlevel 0 (
    echo ✓ npm: AVAILABLE
) else (
    echo ✗ npm: NOT FOUND (normal if not installed)
)

echo Checking go...
go version >nul 2>&1
if errorlevel 0 (
    echo ✓ go: AVAILABLE
) else (
    echo ✗ go: NOT FOUND (normal if not installed)
)

echo Checking python...
python --version >nul 2>&1
if errorlevel 0 (
    echo ✓ python: AVAILABLE
) else (
    echo ✗ python: NOT FOUND (normal if not installed)
)

REM === TRY CLEANUP WITH ERROR CHECKING ===
echo.
echo [DEBUG] Bắt đầu cleanup...
echo.

REM Test 1: Xóa temp
echo [TEST 1] Xóa %TEMP%...
if exist "%TEMP%" (
    cd /d "%TEMP%" 2>nul
    if errorlevel 1 (
        echo ✗ Không thể vào thư mục TEMP (may be in use)
    ) else (
        echo ✓ Vào thư mục TEMP thành công
        for /d %%A in (*) do (
            echo  - Trying to delete: %%A
            rd /s /q "%%A" 2>nul
            if !errorlevel! equ 0 (
                echo    ✓ Deleted: %%A
            ) else (
                echo    ✗ Failed: %%A (may be locked)
            )
        )
    )
) else (
    echo ✗ TEMP folder not found
)

echo.

REM Test 2: Xóa Windows Temp
echo [TEST 2] Xóa Windows Temp...
if exist "%windir%\Temp" (
    cd /d "%windir%\Temp" 2>nul
    if errorlevel 1 (
        echo ✗ Không thể vào Windows\Temp
    ) else (
        echo ✓ Vào Windows\Temp thành công
        for /d %%A in (*) do (
            echo  - Trying to delete: %%A
            rd /s /q "%%A" 2>nul
            if !errorlevel! equ 0 (
                echo    ✓ Deleted: %%A
            ) else (
                echo    ✗ Failed: %%A
            )
        )
    )
) else (
    echo ✗ Windows\Temp not found
)

echo.

REM Test 3: Chrome cache
echo [TEST 3] Xóa Chrome cache...
if exist "%APPDATA%\Google\Chrome\User Data\" (
    for /d %%A in ("%APPDATA%\Google\Chrome\User Data\*") do (
        set CHROME_PROFILE=%%A
        echo  - Profile: %%~nxA
        if exist "!CHROME_PROFILE!\Cache" (
            rd /s /q "!CHROME_PROFILE!\Cache" 2>nul
            if !errorlevel! equ 0 (
                echo    ✓ Cache deleted
            ) else (
                echo    ✗ Failed (Chrome may be running)
            )
        )
    )
) else (
    echo ✗ Chrome not found
)

echo.

REM Test 4: Prefetch
echo [TEST 4] Xóa Prefetch...
if exist "%windir%\Prefetch" (
    dir "%windir%\Prefetch\*.pf" 2>nul | find /c "pf"
    if !errorlevel! equ 0 (
        del /q "%windir%\Prefetch\*.*" 2>nul
        if !errorlevel! equ 0 (
            echo ✓ Prefetch deleted
        ) else (
            echo ✗ Failed to delete some prefetch files
        )
    )
) else (
    echo ✗ Prefetch folder not found
)

echo.

REM Test 5: Recycle Bin
echo [TEST 5] Xóa Recycle Bin...
if exist "C:\$Recycle.Bin" (
    rd /s /q "C:\$Recycle.Bin" 2>nul
    if !errorlevel! equ 0 (
        echo ✓ Recycle Bin deleted
    ) else (
        echo ✗ Failed to delete Recycle Bin (may need restart)
    )
) else (
    echo ✗ Recycle Bin not found
)

echo.

REM === RESULT ===
echo ╔════════════════════════════════════════════════╗
echo ║          DEBUG TEST HOÀN THÀNH                ║
echo ╚════════════════════════════════════════════════╝
echo.
echo Xem lỗi ✗ ở trên để biết vấn đề gì
echo.
echo GIẢI PHÁP THƯ THƯỜNG:
echo 1. Đóng Chrome/Edge/Firefox trước cleanup
echo 2. Chạy lại script trong chế độ Safe Mode
echo 3. Dùng SAFE_VERSION.bat thay vì v2.0
echo.

pause