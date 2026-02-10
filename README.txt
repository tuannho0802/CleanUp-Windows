╔══════════════════════════════════════════════════════════════════╗
║                  DEEP CLEAN WINDOWS v2.0                        ║
║             Windows System Cleanup Suite                        ║
║                 README & QUICK START                            ║
╚══════════════════════════════════════════════════════════════════╝


🚀 QUICK START - BẮTĐẦU NHANH
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. Nhấp chuột phải file: Deep_Clean_Windows_Advanced.bat
2. Chọn: "Run as Administrator"
3. Xem tiến độ và chờ hoàn thành
4. Kiểm tra log: Desktop\CleanupLog.txt

✅ Xong! Máy tính của bạn giờ sạch sẽ hơn.


📦 PACKAGE CONTENTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

File 1: Deep_Clean_Windows_Advanced.bat ⭐ MAIN SCRIPT
├─ Loại: Batch Script (Windows)
├─ Kích thước: ~280 lines
├─ Mục đích: Dọn dẹp Windows toàn diện
├─ Yêu cầu: Windows 10/11 + Quyền Admin
└─ Cách chạy:
   • Normal: Right-click → Run as Administrator
   • Silent: cmd.exe: Deep_Clean_Windows_Advanced.bat silent
   • Task Scheduler: Setup tự động

File 2: HƯỚNG_DẪN_SỬ_DỤNG.txt 📖 MANUAL CHÍNH
├─ Loại: Text Documentation (Vietnamese)
├─ Nội dung:
│  • Yêu cầu hệ thống
│  • Cách chạy (3 cách khác nhau)
│  • Chi tiết 15 tác vụ dọn dẹp
│  • Chế độ Silent/Verbose
│  • Xử lý sự cố
│  • Bảo mật & Cảnh báo
│  • FAQ
└─ Đọc trước lần chạy đầu tiên

File 3: SCRIPT_BỔ_SUNG_VÀ_TỰY_CHỈNH.txt ⚙️ ADVANCED GUIDE
├─ Loại: Advanced Documentation
├─ Nội dung:
│  • So sánh v1.0 vs v2.0
│  • Cách disable services
│  • Tối ưu hệ thống bổ sung
│  • Scripts tùy chỉnh nhỏ
│  • Registry cleanup an toàn
│  • Monitoring folder size
│  • FAQ chi tiết
└─ Đọc nếu muốn tối ưu thêm

File 4: CHANGELOG.txt 📊 VERSION HISTORY
├─ Loại: Version Information
├─ Nội dung:
│  • Thống kê version
│  • Tính năng mới (v2.0)
│  • Cải tiến từ v1.0
│  • So sánh chi tiết
│  • Hướng dẫn nâng cấp
│  • Migration checklist
└─ Đọc để hiểu sự thay đổi

File 5: README.txt (FILE NÀY) 📍 START HERE
├─ Loại: Quick Reference
├─ Nội dung:
│  • Overview
│  • Package contents
│  • Quick start guide
│  • Troubleshooting
│  • System requirements
└─ Đọc trước tiên


📋 SYSTEM REQUIREMENTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✓ Windows 10 (Build 1909 hoặc cao hơn)
  hoặc
✓ Windows 11 (Tất cả versions)

✓ Quyền Admin / Administrator Account

✓ 1 GB dung lượng ổ đĩa trống (tối thiểu)

✓ Kết nối Internet (để npm cache clean)

✓ Không yêu cầu phần mềm bổ sung nào


❌ CÓ THỂ KHÔNG HOẠT ĐỘNG TRÊN:
  • Windows 7, 8, 8.1 (không hỗ trợ chkdsk syntax)
  • Home Network drives (cần Admin trên drive đó)
  • Corporate domain machines (GPO policies)


⚡ MAIN FEATURES - CÁC TÍNH NĂNG CHÍNH
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ DỌNĐẸP:
  ✓ Temp files (%TEMP%, Windows\Temp)
  ✓ Browser cache (Chrome, Edge, Firefox)
  ✓ Developer tools cache (VSCode, npm, Python)
  ✓ Windows Update cache
  ✓ Delivery Optimization cache
  ✓ Thumbnails & preview cache
  ✓ System logs cũ
  ✓ Recycle Bin

✅ TỐI ƯU:
  ✓ CHKDSK scan
  ✓ Disk Cleanup automation
  ✓ Registry cleanup an toàn
  ✓ Services listing

✅ BẢOMẬT & LOGGING:
  ✓ Admin rights check
  ✓ Detailed logging to file
  ✓ Per-operation error handling
  ✓ Progress indicators

✅ LINH HOẠT:
  ✓ Silent mode (chạy âm thầm)
  ✓ Verbose mode (chạy với thông báo)
  ✓ Task Scheduler compatible
  ✓ Command-line parameters


📊 DUNG LƯỢNG GIẢI PHÓNG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Máy tính hàng ngày:
  → 500 MB - 2 GB

Máy tính hàng tuần:
  → 2 GB - 5 GB

Máy tính lâu không dọn (>1 tháng):
  → 5 GB - 20+ GB

Máy tính với nhiều developer tools:
  → 10 GB - 30+ GB


🎯 KHI NÀO CHẠY SCRIPT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ CHẠY NGAY NẾU:
  • Máy tính chạy chậm
  • Lần đầu tiên sử dụng
  • Sau Windows Update lớn
  • Ổ đĩa gần đầy

✅ CHẠY ĐỊNH KỲ:
  • Hàng tuần (mỗi Chủ nhật tối)
  • Hoặc hàng tháng (tối thiểu)

✅ SETUP TỰ ĐỘNG:
  • Task Scheduler (tham khảo: HƯỚNG_DẪN_SỬ_DỤNG.txt)
  • Chạy mỗi tuần vào lúc xác định


⚠️ CẢNH BÁO QUAN TRỌNG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. ⚠️ ĐÓNG TRÌNH DUYỆT TRƯỚC
   • Script sẽ xóa browser cache
   • Nếu browser mở sẽ lỗi
   • → Đóng Chrome, Edge, Firefox, v.v.

2. ⚠️ KHÔNG TẮT MÁY KHI SCRIPT CHẠY
   • Đang sửa đổi Windows Update
   • Có thể làm hỏng hệ thống
   • → Chờ cho đến khi hoàn thành

3. ⚠️ BACKUP DỮ LIỆU QUAN TRỌNG
   • Script không xóa file cá nhân
   • Nhưng nếu lo lắng thì backup Desktop trước

4. ⚠️ CHKDSK CÓ THỂ YÊU CẦU KHỞI ĐỘNG LẠI
   • Chọn "Yes" khi hỏi
   • Quét sẽ chạy lần khởi động tiếp theo

5. ⚠️ LẦN KHỞI ĐỘNG TIẾP THEO CÓ THỂ CHẬM
   • Do prefetch bị xóa
   • Windows sẽ tái tạo lại
   • Chỉ là lần đầu tiên


🔍 TROUBLESHOOTING - XỬ LÝ SỰ CỐ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

❌ VẤNĐỀ: "Access Denied"
───────────────────────────────────────────────────────────────
Nguyên nhân: Không chạy với quyền Admin
Giải pháp:
  1. Đóng script
  2. Nhấp chuột phải vào .bat file
  3. Chọn "Run as Administrator"
  4. Click "Yes" khi hỏi UAC


❌ VẤNĐỀ: Browser cache không bị xóa
───────────────────────────────────────────────────────────────
Nguyên nhân: Trình duyệt đang chạy
Giải pháp:
  1. Đóng tất cả cửa sổ Chrome/Edge/Firefox
  2. Đóng tất cả tabs
  3. Chạy lại script
  4. Kiểm tra log để xác nhận


❌ VẤNĐỀ: Script tắt đột ngột
───────────────────────────────────────────────────────────────
Nguyên nhân: Có lỗi khi thực thi
Giải pháp:
  1. Mở: Desktop\CleanupLog.txt
  2. Tìm dòng có "✗"
  3. Xóa thủ công thư mục đó
  4. Chạy lại script


❌ VẤNĐỀ: Windows Update không hoạt động sau cleanup
───────────────────────────────────────────────────────────────
Nguyên nhân: Folder SoftwareDistribution bị lỗi
Giải pháp:
  1. Mở CMD as Admin
  2. Chạy: sfc /scannow
  3. Windows sẽ tái tạo folder
  4. Chạy Windows Update


❌ VẤNĐỀ: CHKDSK yêu cầu khởi động lại
───────────────────────────────────────────────────────────────
Nguyên nhân: Ổ đĩa đang sử dụng
Giải pháp:
  1. Nhập "Y" khi hỏi
  2. Khởi động lại máy tính
  3. CHKDSK sẽ chạy tự động
  4. Quá trình mất 15-30 phút


❌ VẤNĐỀ: Script không tìm thấy npm/Python/Go
───────────────────────────────────────────────────────────────
Nguyên nhân: Tools không được cài đặt
Giải pháp:
  • Bình thường - script sẽ skip nó
  • Log sẽ ghi "command not found"
  • Không ảnh hưởng đến dọn dẹp khác


📖 READING ORDER - THỨ TỰ ĐỌC TƯƠNG TỰ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Lần đầu tiên:
  1. README.txt (file này) ← Bạn ở đây
  2. HƯỚNG_DẪN_SỬ_DỤNG.txt
  3. Chạy script ở chế độ verbose

Nếu muốn tối ưu thêm:
  4. SCRIPT_BỔ_SUNG_VÀ_TỰY_CHỈNH.txt
  5. Chạy các script bổ sung

Nếu muốn hiểu sâu hơn:
  6. CHANGELOG.txt
  7. Xem code của .bat file


💡 TIPS & TRICKS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1️⃣ TIP: Setup Task Scheduler
   Chạy tự động hàng tuần:
   • Mở: Task Scheduler (Win + R: taskschd.msc)
   • Create Basic Task
   • Trigger: Weekly (Sunday 23:00)
   • Action: Deep_Clean_Windows_Advanced.bat silent
   • Run with highest privileges: ✓

2️⃣ TIP: Check Log thường xuyên
   • Mở: Desktop\CleanupLog.txt
   • Tìm dòng có "✗" để phát hiện vấn đề
   • Tìm "✓" để xác nhận thành công

3️⃣ TIP: Silent mode cho Task Scheduler
   • Chạy: Deep_Clean_Windows_Advanced.bat silent
   • Không hiển thị dialog
   • Hoàn hảo cho automated cleanup

4️⃣ TIP: Combine với script khác
   • Tạo master_cleanup.bat:
     call Deep_Clean_Windows_Advanced.bat silent
     call defrag C: /O
     echo Cleanup hoàn tất!

5️⃣ TIP: Monitor trước/sau
   • Kiểm tra dung lượng ổ đĩa trước
   • Chạy script
   • Kiểm tra lại - thường giải phóng 2-5 GB

6️⃣ TIP: Giữ log history
   • Rename log sau mỗi cleanup
   • Ví dụ: CleanupLog_2024-02-10.txt
   • Có thể so sánh kết quả theo thời gian


❓ FREQUENTLY ASKED QUESTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Q: Script có an toàn không?
A: ✓ CÓ. Xóa file tạm/cache, KHÔNG xóa file hệ thống.

Q: Có bao nhiêu dung lượng sẽ giải phóng?
A: Tùy thuộc. Từ 500MB đến 20GB+ tùy máy tính.

Q: Tôi có thể chạy mỗi ngày không?
A: ✓ CÓ. Tuy nhiên hàng tuần đã đủ.

Q: Script có thể làm hỏng Windows không?
A: ✗ KHÔNG. Chỉ xóa cache & log, không động hệ thống.

Q: Mật khẩu browser sẽ bị xóa không?
A: ✗ KHÔNG. Mật khẩu lưu ở nơi khác.

Q: Tôi cần khởi động lại máy không?
A: Thường ✗ KHÔNG. Ngoại trừ khi CHKDSK yêu cầu.

Q: Có hỗ trợ Windows 7/8 không?
A: ✗ KHÔNG. Chỉ Windows 10/11.

Q: Log file ở đâu?
A: Desktop\CleanupLog.txt

Q: Tôi có thể tùy chỉnh script không?
A: ✓ CÓ. Xem: SCRIPT_BỔ_SUNG_VÀ_TỰY_CHỈNH.txt


📞 SUPPORT & FEEDBACK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Gặp vấn đề?
  1. Đọc file HƯỚNG_DẪN_SỬ_DỤNG.txt
  2. Kiểm tra CleanupLog.txt để tìm lỗi
  3. Chạy lại ở chế độ verbose
  4. Thử xóa thủ công folder bị lỗi

Muốn cải tiến?
  • Tham khảo: SCRIPT_BỔ_SUNG_VÀ_TỰY_CHỈNH.txt
  • Edit file .bat để custom


🎯 NEXT STEPS - CÁC BƯỚC TIẾP THEO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. ✅ Đọc xong README.txt
2. ✅ Đọc HƯỚNG_DẪN_SỬ_DỤNG.txt
3. ✅ Chạy: Deep_Clean_Windows_Advanced.bat (ở chế độ normal lần đầu)
4. ✅ Kiểm tra: CleanupLog.txt
5. ✅ (Tùy chọn) Setup Task Scheduler
6. ✅ (Tùy chọn) Tìm hiểu SCRIPT_BỔ_SUNG_VÀ_TỰY_CHỈNH.txt

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Bạn đã sẵn sàng!

Chúc bạn dọn dẹp Windows thành công!
Máy tính sẽ cảm ơn bạn! 😊

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Version: 2.0
Last Updated: 2026
Supported: Windows 10/11
Language: Vietnamese/English

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
