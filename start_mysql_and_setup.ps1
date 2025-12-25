# سكريبت لتشغيل MySQL وإعداد قاعدة البيانات

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  إعداد وتشغيل MySQL" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# التحقق من XAMPP
$xamppPath = "C:\xampp"
if (Test-Path $xamppPath) {
    Write-Host "✅ تم العثور على XAMPP" -ForegroundColor Green
    
    $mysqlPath = "$xamppPath\mysql\bin\mysqld.exe"
    $mysqlCliPath = "$xamppPath\mysql\bin\mysql.exe"
    
    if (Test-Path $mysqlPath) {
        Write-Host "✅ تم العثور على MySQL" -ForegroundColor Green
        
        # التحقق من تشغيل MySQL
        $mysqlProcess = Get-Process | Where-Object {$_.ProcessName -eq "mysqld"}
        
        if ($mysqlProcess) {
            Write-Host "✅ MySQL يعمل بالفعل" -ForegroundColor Green
        } else {
            Write-Host "⚠️  MySQL غير مشغل، جاري التشغيل..." -ForegroundColor Yellow
            Write-Host "يرجى تشغيل MySQL من XAMPP Control Panel يدوياً" -ForegroundColor Yellow
            Write-Host "أو اضغط Enter لمحاولة التشغيل التلقائي..." -ForegroundColor Yellow
            Read-Host
            
            # محاولة تشغيل MySQL
            Start-Process -FilePath $mysqlPath -WindowStyle Hidden
            Start-Sleep -Seconds 3
        }
        
        Write-Host ""
        Write-Host "جاري إعداد قاعدة البيانات..." -ForegroundColor Yellow
        
        # إعداد قاعدة البيانات
        node setup_database.js
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host ""
            Write-Host "========================================" -ForegroundColor Green
            Write-Host "  ✅ تم الإعداد بنجاح!" -ForegroundColor Green
            Write-Host "========================================" -ForegroundColor Green
            Write-Host ""
            Write-Host "الآن يمكنك تشغيل المشروع:" -ForegroundColor Cyan
            Write-Host "  node server.js" -ForegroundColor White
        }
    } else {
        Write-Host "❌ MySQL غير موجود في XAMPP" -ForegroundColor Red
    }
} else {
    Write-Host "❌ XAMPP غير موجود" -ForegroundColor Red
    Write-Host ""
    Write-Host "يرجى:" -ForegroundColor Yellow
    Write-Host "1. تثبيت XAMPP من: https://www.apachefriends.org/" -ForegroundColor White
    Write-Host "2. تشغيل MySQL من XAMPP Control Panel" -ForegroundColor White
    Write-Host "3. إعادة تشغيل هذا السكريبت" -ForegroundColor White
}

