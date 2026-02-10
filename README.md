# 🧹 Deep Clean Windows v2.0

> **A comprehensive Windows cleanup & optimization suite** - Dọn dẹp Windows toàn diện với logging chi tiết, admin check, và multiple operation modes

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Windows](https://img.shields.io/badge/Windows-10%2B11-0078D4?logo=windows11&logoColor=white)](https://www.microsoft.com/windows)
[![Batch](https://img.shields.io/badge/Language-Batch%2FPowerShell-blue)](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands-overview)
[![Status](https://img.shields.io/badge/Status-Active-brightgreen)]()
[![Version](https://img.shields.io/badge/Version-2.0-green)]()

## 📋 Table of Contents

- [Features](#features)
- [Quick Start](#quick-start)
- [System Requirements](#system-requirements)
- [Installation](#installation)
- [Usage](#usage)
- [What Gets Cleaned](#what-gets-cleaned)
- [Operation Modes](#operation-modes)
- [Logging & Safety](#logging--safety)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [Upgrade Path](#upgrade-path)
- [License](#license)

## ✨ Features

### 🧹 **Comprehensive Cleanup**
- ✅ Temp folders (`%TEMP%`, `Windows\Temp`)
- ✅ Browser caches (Chrome, Edge, Firefox)
- ✅ Developer tools cache (VSCode, npm, Python, Go)
- ✅ Windows Update cache (safe, recreates folder)
- ✅ Delivery Optimization cache
- ✅ Thumbnails & preview caches
- ✅ System logs & CrashDumps
- ✅ Recycle Bin cleanup

### 🛡️ **Security & Safety**
- ✅ Automatic admin rights verification
- ✅ Per-operation error handling
- ✅ Detailed logging to file
- ✅ NO system file deletion
- ✅ Safe registry cleanup (empty entries only)
- ✅ Progress indicators with status symbols

### ⚙️ **Flexibility**
- ✅ Silent mode (for Task Scheduler)
- ✅ Verbose mode (interactive with confirmation)
- ✅ Command-line parameters
- ✅ Logging with timestamps
- ✅ Multiple operation modes
- ✅ Task Scheduler compatible

### 🚀 **Performance**
- ✅ CHKDSK disk scan
- ✅ Disk Cleanup automation
- ✅ Services listing
- ✅ Fast execution (~15 minutes)

### 📊 **Professional Documentation**
- ✅ Comprehensive README.md (GitHub style)
- ✅ Detailed user manual (Vietnamese)
- ✅ Version changelog & migration guide
- ✅ Advanced tweaks & customization
- ✅ 12 ready-to-use mini scripts

## 🚀 Quick Start

### **3-Step Setup**

```batch
1. Right-click: Deep_Clean_Windows_Advanced.bat
2. Select: "Run as Administrator"
3. Wait ~15 minutes for completion
```

Check results:
```
Desktop\CleanupLog.txt
```

### **Command Line Usage**

```batch
REM Normal mode (with UI prompts)
Deep_Clean_Windows_Advanced.bat

REM Silent mode (no prompts, automated)
Deep_Clean_Windows_Advanced.bat silent

REM Task Scheduler friendly
cmd /c "Deep_Clean_Windows_Advanced.bat silent" > nul
```

## 📦 System Requirements

### **Minimum**
- **OS**: Windows 10 (Build 1909+) or Windows 11
- **Rights**: Administrator/Admin Account
- **Disk**: 1 GB free space
- **Memory**: 512 MB minimum

### **Recommended**
- **OS**: Windows 11 (latest build)
- **Disk**: 5 GB+ free space
- **Internet**: For npm cache cleaning

### **Not Supported**
- ❌ Windows 7, 8, 8.1
- ❌ Home Network Drives (no admin access)
- ❌ Corporate Domain Machines (GPO restrictions)

## 📥 Installation

### **Method 1: GitHub Releases** (Recommended)
```bash
git clone https://github.com/tuannho0802/CleanUp-Windows.git
cd CleanUp-Windows
```

### **Method 2: Direct Download**
1. Download `Deep_Clean_Windows_Advanced.bat`
2. Place on Desktop or preferred location
3. Right-click → Run as Administrator

### **Method 3: Setup Task Scheduler** (Automated)
1. Open: `Task Scheduler` (`Win + R` → `taskschd.msc`)
2. Create Basic Task
3. Trigger: Weekly (or custom schedule)
4. Action:
   ```
   Program: Deep_Clean_Windows_Advanced.bat
   Arguments: silent
   Run with highest privileges: ✓
   ```

## 🎯 Usage

### **Interactive Mode** (Verbose)
```batch
Deep_Clean_Windows_Advanced.bat
```
- Displays progress for each task
- Shows confirmations
- Requests approval for Disk Cleanup
- Pauses at completion
- **Time**: ~15 minutes

### **Automated Mode** (Silent)
```batch
Deep_Clean_Windows_Advanced.bat silent
```
- No UI prompts
- No confirmations needed
- Runs unattended
- Perfect for scheduled tasks
- **Time**: ~10-15 minutes

### **Example: Custom Cleanup Script**
```batch
@echo off
REM Master cleanup with defrag
call Deep_Clean_Windows_Advanced.bat silent
echo Cleanup completed, starting defrag...
defrag C: /O
echo All done!
pause
```

## 🧹 What Gets Cleaned

| Category | Location | Size Freed | Risk Level |
|----------|----------|-----------|------------|
| **Temp Files** | `%TEMP%`, `Windows\Temp` | 500MB - 2GB | ✅ Safe |
| **Browser Cache** | Chrome, Edge, Firefox | 1GB - 3GB | ✅ Safe* |
| **Developer Tools** | VSCode, npm, Python | 1GB - 3GB | ✅ Safe |
| **Windows Update** | `SoftwareDistribution\Download` | 500MB - 2GB | ✅ Safe |
| **Delivery Optim.** | Network Downloader | 100MB - 1GB | ✅ Safe |
| **Thumbnails** | Explorer cache | 50MB - 500MB | ✅ Safe |
| **System Logs** | Old log files | 50MB - 500MB | ✅ Safe |
| **Recycle Bin** | Deleted files | Varies | ⚠️ Permanent |
| **CrashDumps** | Error dumps | 50MB - 2GB | ✅ Safe |
| **Prefetch** | App startup cache | 10MB - 100MB | ⚠️ Rebuilds |

**`*Safe`: Browser passwords are NOT deleted (stored separately)*

## 🔄 Operation Modes

### **Verbose Mode** (Default)
```
✓ Interactive menu
✓ Progress updates
✓ Confirmation prompts
✓ Status symbols (✓ ✗ ℹ️)
✓ Log file creation
```

### **Silent Mode** (Automated)
```
✓ No UI interaction
✓ No prompts or confirmations
✓ Background execution
✓ Perfect for Task Scheduler
✓ Still creates detailed logs
```

### **Logging**
- **Location**: `%USERPROFILE%\Desktop\CleanupLog.txt`
- **Format**: Timestamped entries
- **Content**: 
  - Operation results (✓ success, ✗ failed)
  - Errors and exceptions
  - Summary statistics
  - Start/end time

## 🛡️ Logging & Safety

### **Safety Features**
1. **Admin Verification**: Checks for elevated privileges before running
2. **Error Handling**: Per-operation try-catch blocks
3. **No System Files**: Never deletes critical Windows files
4. **Registry Safe**: Only removes empty/temporary entries
5. **Backups**: Creates log files for reference
6. **Reversible**: All operations are standard cleanup (not permanent changes)

### **Log File Example**
```
==================================================
DỌN DẸP WINDOWS - 2025-02-10 14:30:45
==================================================

[1/15] Xóa Temp folder (%TEMP%)...
  ✓ Xóa thư mục: TempFolder1
  ✓ Xóa thư mục: TempFolder2
  ✗ Không thể xóa: LockedFile (in use)

[2/15] Xóa Windows Temp (%windir%\Temp)...
  ✓ Cleaned successfully

...

==================================================
DỌN DẸP HOÀN THÀNH - 2025-02-10 14:45:12
Tổng: 15 tác vụ, 13 thành công, 2 lỗi
==================================================
```

## 📊 Performance Impact

### **Disk Space Freed**
- **Daily machine**: 500 MB - 2 GB
- **Weekly machine**: 2 GB - 5 GB  
- **Monthly machine**: 5 GB - 20+ GB
- **Developer machine**: 10 GB - 30+ GB

### **Execution Time**
- **Verbose mode**: ~15 minutes
- **Silent mode**: ~10-15 minutes
- **Disk Cleanup**: +5 minutes (optional)
- **CHKDSK scan**: +10 minutes (runs next boot)

### **System Performance**
- ✅ Improved boot time
- ✅ Reduced disk fragmentation
- ✅ Lower memory usage
- ✅ Faster disk access

⚠️ **Note**: First boot after cleanup may be slightly slower (Windows rebuilds caches)

## 🔧 Troubleshooting

### ❌ "Access Denied" Error
**Problem**: Script requires admin rights  
**Solution**:
```
1. Right-click: Deep_Clean_Windows_Advanced.bat
2. Select: "Run as Administrator"
3. Click "Yes" on UAC prompt
```

### ❌ Browser Cache Not Deleted
**Problem**: Browsers still running  
**Solution**:
```
1. Close all browser windows
2. Close all browser tabs
3. Run script again
4. Check log for confirmation
```

### ❌ Script Exits Unexpectedly
**Problem**: Error during execution  
**Solution**:
```
1. Check: Desktop\CleanupLog.txt
2. Find line with "✗"
3. Manually delete problem folder
4. Run script again
```

### ❌ Windows Update Not Working
**Problem**: SoftwareDistribution folder corrupted  
**Solution**:
```cmd
REM Run as Admin
sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth
Restart-Computer
```

### ❌ CHKDSK Requires Restart
**Problem**: Drive in use  
**Solution**:
```
1. Press "Y" when prompted
2. Restart computer
3. CHKDSK runs automatically
4. Process takes 15-30 minutes
```

## 🔗 File Structure

```
CleanUp-Windows/
├── Deep_Clean_Windows_Advanced.bat      ⭐ Main script
├── README.md                            📖 This file (GitHub)
├── HƯỚNG_DẪN_SỬ_DỤNG.txt               📖 Vietnamese manual
├── CHANGELOG.txt                        📊 Version history
├── SCRIPT_BỔ_SUNG_VÀ_TỰY_CHỈNH.txt    ⚙️  Advanced guide
├── MINI_SCRIPTS_COLLECTION.txt          🎯 12 mini scripts
├── PACKAGE_INDEX.txt                    📋 File index
└── LICENSE                              ⚖️  MIT License
```

## 🎓 Documentation

### **For Beginners**
1. Read: `README.md` (this file)
2. Read: `HƯỚNG_DẪN_SỬ_DỤNG.txt` (Vietnamese manual)
3. Run: `Deep_Clean_Windows_Advanced.bat` (verbose mode)
4. Check: `Desktop\CleanupLog.txt`

### **For Advanced Users**
1. Read: `CHANGELOG.txt` (features & improvements)
2. Read: `SCRIPT_BỔ_SUNG_VÀ_TỰY_CHỈNH.txt` (advanced options)
3. Read: `MINI_SCRIPTS_COLLECTION.txt` (12 additional scripts)
4. Customize & deploy

### **For Automation**
1. Setup Task Scheduler (see Installation → Method 3)
2. Run: `Deep_Clean_Windows_Advanced.bat silent`
3. Monitor: `Desktop\CleanupLog.txt`

## 📈 Upgrade Path

### **v2.0 Improvements**
- ✅ Admin check + automatic UAC
- ✅ Detailed logging system
- ✅ Error handling per-operation
- ✅ Silent/Verbose modes
- ✅ Task Scheduler compatible
- ✅ Delivery Optimization cleanup
- ✅ Thumbnails cleanup
- ✅ CHKDSK scan integration
- ✅ Disk Cleanup automation
- ✅ Safe registry cleanup
- ✅ Professional documentation

### **Planned v2.1+**
- 🔜 Interactive menu (like Perfect Windows 11)
- 🔜 Privacy hardening tweaks
- 🔜 Gaming optimizations
- 🔜 Network optimizations
- 🔜 Power management options
- 🔜 UI customization (remove ads)
- 🔜 Restore functionality
- 🔜 PowerShell wrapper
- 🔜 GUI dashboard

## 🤝 Contributing

Contributions welcome! 

- **Report Bugs**: [Open Issue](../../issues) with log file
- **Suggest Features**: [Open Issue](../../issues) with use case
- **Submit Code**: Create Pull Request with tests
- **Improve Docs**: Fix typos, add clarifications, translate

## ⚠️ Important Notes

### **Before Running**
- ⚠️ **Close all browsers** (Chrome, Edge, Firefox)
- ⚠️ **Backup important data** (if concerned)
- ⚠️ **Create restore point** (optional but recommended)
- ✅ **Ensure admin rights**

### **During Execution**
- ⚠️ **Do NOT shut down**
- ⚠️ **Do NOT interrupt** script
- ✅ **Wait ~15 minutes**
- ✅ **Monitor log** if needed

### **After Execution**
- ℹ️ **First boot may be slower** (Windows rebuilds caches)
- ✅ **System will be faster** afterwards
- ✅ **Log saved** for reference
- ✅ **Verify no issues** in log

## 📞 Support

1. **Check FAQ**: See `HƯỚNG_DẪN_SỬ_DỤNG.txt`
2. **View Log**: Check `Desktop\CleanupLog.txt`
3. **Open Issue**: [GitHub Issues](../../issues)
4. **Read Guides**: `SCRIPT_BỔ_SUNG_VÀ_TỰY_CHỈNH.txt`

**Report issues with:**
- Windows version
- Error from log file
- Steps to reproduce

## 📜 License

MIT License - see [LICENSE](LICENSE)

**You can:** ✅ Use, modify, distribute, use commercially  
**You must:** ✅ Include license & copyright notice

## 👨‍💻 Credits

- **Creator**: tuannho0802
- **Inspired by**: [Perfect Windows 11](https://github.com/vacisdev/windows11)
- **Community**: Windows optimization best practices

## 🌟 Thanks

- vacisdev for privacy/optimization reference
- Windows community for feedback
- All contributors

## 📊 Stats

```
Language:        Batch / PowerShell
Files:           7 (1 script + 6 docs)
Code Lines:      ~3,500+
Test Platform:   Windows 10/11
Last Updated:    2025-02-10
```

## 🔗 Related

- [Perfect Windows 11](https://github.com/vacisdev/windows11) - Privacy tweaks
- [O&O CleanerFree](https://www.oosoft.com/) - Commercial alternative
- [CCleaner](https://www.ccleaner.com/) - Commercial alternative

---

<div align="center">

**⭐ Star if useful!**

**Made with ❤️ for Windows optimization**

[↑ Back to Top](#-deep-clean-windows-v20)

</div>
