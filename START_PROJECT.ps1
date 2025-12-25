# سكريبت PowerShell لتشغيل المشروع

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  تشغيل مشروع سوق اللوحات" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# التحقق من قاعدة البيانات
Write-Host "[1/3] التحقق من قاعدة البيانات..." -ForegroundColor Yellow
Write-Host "تأكد من تشغيل MySQL وأن قاعدة البيانات موجودة" -ForegroundColor Gray
Write-Host ""

# تشغيل Backend
Write-Host "[2/3] تشغيل Backend..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot'; Write-Host 'Backend Server - http://localhost:5000' -ForegroundColor Green; node server.js"
Start-Sleep -Seconds 3

# تشغيل Frontend
Write-Host "[3/3] تشغيل Frontend..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\client'; Write-Host 'Frontend React - http://localhost:3000' -ForegroundColor Green; npm start"
Start-Sleep -Seconds 2

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  تم تشغيل المشروع بنجاح!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Backend:  http://localhost:5000" -ForegroundColor Cyan
Write-Host "Frontend: http://localhost:3000" -ForegroundColor Cyan
Write-Host ""
Write-Host "لإضافة البيانات التجريبية:" -ForegroundColor Yellow
Write-Host "mysql -u root -p license_plate_marketplace < database/mock_data.sql" -ForegroundColor Gray
Write-Host ""
Write-Host "الحسابات التجريبية موجودة في ملف: TEST_ACCOUNTS.md" -ForegroundColor Yellow
Write-Host ""

