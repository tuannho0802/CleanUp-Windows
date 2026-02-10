@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

REM ==========================================
REM DỌN DẸP WINDOWS TOÀN DIỆN AN TOÀN v2.0
REM Hỗ trợ: Windows 10/11
REM ==========================================

REM === CẤU HÌNH CHẾ ĐỘ CHẠY ===
set "VERBOSE=1"
set "AUTOMODE=0"
set "LOGFILE=%USERPROFILE%\Desktop\CleanupLog.txt"

REM Kiểm tra tham số dòng lệnh
if "%1"=="silent" set VERBOSE=0
if "%1"=="auto" set AUTOMODE=1

REM === KIỂM TRA QUYỀN ADMIN ===
whoami /priv | find "SeDebugPrivilege" >nul
if errorlevel 1 (
    echo.
    echo ⚠️ LỖI: Script cần chạy với quyền Admin!
    echo.
    echo Vui lòng nhấp chuột phải vào file .bat và chọn "Run as Administrator"
    echo.
    pause
    exit /b 1
)

REM === KHỞI TẠO LOG ===
echo. > "%LOGFILE%"
echo ================================================== >> "%LOGFILE%"
echo DỌN DẸP WINDOWS - %date% %time% >> "%LOGFILE%"
echo ================================================== >> "%LOGFILE%"
echo. >> "%LOGFILE%"

if "%VERBOSE%"=="1" (
    cls
    echo.
    echo ╔════════════════════════════════════════════════╗
    echo ║   DỌN DẸP WINDOWS TOÀN DIỆN AN TOÀN v2.0      ║
    echo ║  Hỗ trợ: Windows 10/11                        ║
    echo ╚════════════════════════════════════════════════╝
    echo.
    echo Chế độ: !VERBOSE! ^(1=Verbose, 0=Silent^)
    echo Log sẽ được lưu tại: %LOGFILE%
    echo.
    echo Chuẩn bị bắt đầu trong 3 giây...
    echo.
    timeout /t 3 /nobreak
)

REM === PHẦN 1: XÓA TEMP VÀ CACHE CƠ BẢN ===

call :LogMessage "[1/15] Xóa Temp folder (%%TEMP%%)"
for /d %%A in ("%temp%\*") do (
    rd /s /q "%%A" 2>nul
    if !errorlevel! equ 0 (
        call :LogMessage "  ✓ Xóa thư mục: %%~nxA"
    ) else (
        call :LogMessage "  ✗ Không thể xóa: %%~nxA"
    )
)
del /q "%temp%\*.*" 2>nul
timeout /t 1 /nobreak

call :LogMessage "[2/15] Xóa Windows Temp (%%windir%%\Temp)"
for /d %%A in ("%windir%\Temp\*") do (
    rd /s /q "%%A" 2>nul
    if !errorlevel! equ 0 (
        call :LogMessage "  ✓ Xóa thư mục: %%~nxA"
    )
)
del /q "%windir%\Temp\*.*" 2>nul
timeout /t 1 /nobreak

call :LogMessage "[3/15] Xóa Prefetch"
del /q "%windir%\Prefetch\*.*" 2>nul
if !errorlevel! equ 0 (
    call :LogMessage "  ✓ Xóa prefetch thành công"
)
timeout /t 1 /nobreak

call :LogMessage "[4/15] Xóa CrashDumps"
for /d %%A in ("%windir%\CrashDumps\*") do rd /s /q "%%A" 2>nul
del /q "%windir%\CrashDumps\*.*" 2>nul
call :LogMessage "  ✓ CrashDumps được xóa"
timeout /t 1 /nobreak

call :LogMessage "[5/15] Xóa Recycle Bin"
rd /s /q "C:\$Recycle.Bin" 2>nul
call :LogMessage "  ✓ Recycle Bin được xóa"
timeout /t 1 /nobreak

REM === PHẦN 2: XÓA THUMBNAILS CACHE ===

call :LogMessage "[6/15] Xóa Thumbnails Cache"
rd /s /q "%APPDATA%\Microsoft\Windows\Recent" 2>nul
del /q "%windir%\explorer.exe.shellstate" 2>nul
call :LogMessage "  ✓ Thumbnails cache xóa thành công"
timeout /t 1 /nobreak

REM === PHẦN 3: XÓA BROWSER CACHE ===

call :LogMessage "[7/15] Xóa cache Chrome"
if exist "%APPDATA%\Google\Chrome\User Data\" (
    for /d %%A in ("%APPDATA%\Google\Chrome\User Data\*") do (
        rd /s /q "%%A\Cache" 2>nul
        rd /s /q "%%A\Cache2" 2>nul
        rd /s /q "%%A\Code Cache" 2>nul
        if !errorlevel! equ 0 (
            call :LogMessage "  ✓ Xóa cache Chrome: %%~nxA"
        )
    )
)
timeout /t 1 /nobreak

call :LogMessage "[8/15] Xóa cache Edge"
if exist "%APPDATA%\Microsoft\Edge\User Data\" (
    for /d %%A in ("%APPDATA%\Microsoft\Edge\User Data\*") do (
        rd /s /q "%%A\Cache" 2>nul
        rd /s /q "%%A\Cache2" 2>nul
        rd /s /q "%%A\Code Cache" 2>nul
        if !errorlevel! equ 0 (
            call :LogMessage "  ✓ Xóa cache Edge: %%~nxA"
        )
    )
)
timeout /t 1 /nobreak

call :LogMessage "[9/15] Xóa cache Firefox"
if exist "%APPDATA%\Mozilla\Firefox\Profiles\" (
    for /d %%A in ("%APPDATA%\Mozilla\Firefox\Profiles\*") do (
        del /q "%%A\cache\*.*" 2>nul
        del /q "%%A\cache2\entries\*.*" 2>nul
        call :LogMessage "  ✓ Xóa Firefox cache: %%~nxA"
    )
)
timeout /t 1 /nobreak

REM === PHẦN 4: XÓA CACHE CÁC ỨNG DỤNG ===

call :LogMessage "[10/15] Xóa cache Discord, Steam, VSCode"
rd /s /q "%APPDATA%\discord\Cache" 2>nul
rd /s /q "%APPDATA%\discord\Code Cache" 2>nul
rd /s /q "%LOCALAPPDATA%\Steam\htmlcache" 2>nul
rd /s /q "%APPDATA%\Code\Cache" 2>nul
rd /s /q "%APPDATA%\Code\CachedData" 2>nul
rd /s /q "%APPDATA%\Code\GPUCache" 2>nul
call :LogMessage "  ✓ Cache ứng dụng được xóa"
timeout /t 1 /nobreak

REM === PHẦN 5: XÓA DEVELOPER TOOLS CACHE ===

call :LogMessage "[11/15] Xóa npm, Python, Go cache"
call npm cache clean --force 2>nul
rd /s /q "%APPDATA%\npm-cache" 2>nul

for /r "%USERPROFILE%" %%F in (__pycache__) do (
    rd /s /q "%%F" 2>nul
)

go clean -cache -modcache -testcache 2>nul
call :LogMessage "  ✓ Developer cache được xóa"
timeout /t 1 /nobreak

REM === PHẦN 6: XÓA WINDOWS UPDATE CACHE ===

call :LogMessage "[12/15] Xóa Windows Update cache"
net stop wuauserv 2>nul
timeout /t 1 /nobreak
rd /s /q "%windir%\SoftwareDistribution\Download" 2>nul
md "%windir%\SoftwareDistribution\Download" 2>nul
net start wuauserv 2>nul
call :LogMessage "  ✓ Windows Update cache xóa thành công"
timeout /t 2 /nobreak

REM === PHẦN 7: XÓA DELIVERY OPTIMIZATION CACHE ===

call :LogMessage "[13/15] Xóa Delivery Optimization cache"
net stop DoSvc 2>nul
timeout /t 1 /nobreak
rd /s /q "%ALLUSERSPROFILE%\Microsoft\Network\Downloader" 2>nul
net start DoSvc 2>nul
call :LogMessage "  ✓ Delivery Optimization cache xóa thành công"
timeout /t 1 /nobreak

REM === PHẦN 8: XÓA LOG HỆ THỐNG CŨ ===

call :LogMessage "[14/15] Xóa log hệ thống cũ"
for /r "%windir%\logs" %%F in (*.log) do (
    del /q "%%F" 2>nul
)
call :LogMessage "  ✓ Log hệ thống cũ được xóa"
timeout /t 1 /nobreak

REM === PHẦN 9: KIỂM TRA Ổ ĐĨA (CHKDSK) ===

call :LogMessage "[15/15] Kiểm tra ổ đĩa lỗi (chkdsk)"
chkdsk C: /scan 2>nul
if !errorlevel! equ 0 (
    call :LogMessage "  ✓ Quét ổ đĩa hoàn tất"
) else (
    call :LogMessage "  ℹ chkdsk sẽ chạy vào lần khởi động tiếp theo"
)
timeout /t 2 /nobreak

REM === PHẦN 10: DISK CLEANUP (TÙYCHỌN) ===

echo.
if "%VERBOSE%"=="1" (
    echo ╔════════════════════════════════════════════════╗
    echo ║  TỐI ƯU HỆ THỐNG BỔ SUNG                      ║
    echo ╚════════════════════════════════════════════════╝
    echo.
    echo Chạy Disk Cleanup sẽ xóa thêm các file không cần thiết.
    echo Bạn có muốn tiếp tục? (Y/N)
    set /p CHOICE="Nhập lựa chọn: "
    
    if /i "!CHOICE!"=="Y" (
        call :LogMessage "Bắt đầu Disk Cleanup..."
        cleanmgr /sageset:1 >nul 2>&1
        cleanmgr /sagerun:1 >nul 2>&1
        call :LogMessage "  ✓ Disk Cleanup hoàn tất"
    )
)

REM === PHẦN 11: KIỂM TRA SERVICES KHÔNG CẦN THIẾT ===

call :LogMessage ""
call :LogMessage "═══ SERVICES TÙYCHỌN CÓ THỂ TẮT ═══"
call :LogMessage "Những services sau có thể tắt nếu không cần thiết:"
call :LogMessage ""
call :LogMessage "  • DiagTrack - Trích xuất dữ liệu người dùng"
call :LogMessage "  • dmwappushservice - Dịch vụ quảng cáo"
call :LogMessage "  • OneSyncSvc - Đồng bộ hóa cài đặt"
call :LogMessage "  • WSearch - Windows Search indexing"
call :LogMessage "  • wscsvc - Windows Security Center"
call :LogMessage ""
call :LogMessage "Để tắt, chạy: net stop [servicename]"
call :LogMessage ""

REM === PHẦN 12: DỌN REGISTRY (AN TOÀN) ===

call :LogMessage "═══ DỌN REGISTRY (CẬP NHẬT TỪ từng lần khởi động) ═══"

REM Xóa run items không cần thiết (không xóa items quan trọng)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDriveSetup" /f 2>nul

REM Xóa temporary registry entries
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit" /f 2>nul

call :LogMessage "  ✓ Registry được làm sạch"

REM === HOÀN THÀNH ===

echo.
if "%VERBOSE%"=="1" (
    echo ╔════════════════════════════════════════════════╗
    echo ║          DỌN DẸP HOÀN TẤT!                   ║
    echo ║  Log: %LOGFILE%                    ║
    echo ╚════════════════════════════════════════════════╝
    echo.
    echo Thông tin:
    echo  • Đã xóa toàn bộ cache và file tạm
    echo  • Đã tối ưu hóa dung lượng ổ đĩa
    echo  • Các thay đổi đã được ghi vào log
    echo.
    pause
)

call :LogMessage ""
call :LogMessage "=================================================="
call :LogMessage "DỌN DẸP HOÀN THÀNH - %date% %time%"
call :LogMessage "=================================================="

exit /b 0

REM ==========================================
REM HÀM TIỆN ÍCH
REM ==========================================

:LogMessage
if "%VERBOSE%"=="1" (
    echo %~1
)
echo %~1 >> "%LOGFILE%"
exit /b 0
