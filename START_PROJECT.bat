@echo off
echo ========================================
echo   تشغيل مشروع سوق اللوحات
echo ========================================
echo.

echo [1/3] التحقق من قاعدة البيانات...
echo تأكد من تشغيل MySQL وأن قاعدة البيانات موجودة
echo.

echo [2/3] تشغيل Backend...
start "Backend Server" cmd /k "cd /d %~dp0 && node server.js"
timeout /t 3 /nobreak >nul

echo [3/3] تشغيل Frontend...
start "Frontend React" cmd /k "cd /d %~dp0client && npm start"
timeout /t 2 /nobreak >nul

echo.
echo ========================================
echo   تم تشغيل المشروع!
echo ========================================
echo.
echo Backend: http://localhost:5000
echo Frontend: http://localhost:3000
echo.
echo اضغط أي مفتاح للإغلاق...
pause >nul

