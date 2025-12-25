@echo off
chcp 65001 >nul
echo ========================================
echo   تشغيل مشروع سوق اللوحات - كامل
echo ========================================
echo.

echo [1/4] التحقق من MySQL...
powershell -ExecutionPolicy Bypass -File start_mysql_and_setup.ps1
if errorlevel 1 (
    echo.
    echo ⚠️  يرجى تشغيل MySQL من XAMPP Control Panel أولاً
    echo اضغط أي مفتاح للمتابعة...
    pause >nul
)

echo.
echo [2/4] إعداد قاعدة البيانات...
node setup_database.js
if errorlevel 1 (
    echo.
    echo ⚠️  فشل إعداد قاعدة البيانات
    echo تأكد من تشغيل MySQL
    pause
    exit /b 1
)

echo.
echo [3/4] تشغيل Backend...
start "Backend Server" cmd /k "cd /d %~dp0 && echo Backend Server - http://localhost:5000 && node server.js"
timeout /t 3 /nobreak >nul

echo.
echo [4/4] تشغيل Frontend...
start "Frontend React" cmd /k "cd /d %~dp0client && echo Frontend React - http://localhost:3000 && npm start"
timeout /t 2 /nobreak >nul

echo.
echo ========================================
echo   ✅ تم تشغيل المشروع!
echo ========================================
echo.
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:3000
echo.
echo تأكد من تشغيل MySQL من XAMPP Control Panel
echo.
echo اضغط أي مفتاح للإغلاق...
pause >nul

