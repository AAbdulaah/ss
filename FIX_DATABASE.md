# حل مشكلة قاعدة البيانات

## الخطوات السريعة:

### 1. تحقق من MySQL:
```powershell
# في PowerShell
mysql --version
```

إذا ظهر خطأ، MySQL غير مثبت.

### 2. إذا كان MySQL مثبتاً:

#### أ. تحقق من تشغيل MySQL:
```powershell
Get-Service | Where-Object {$_.Name -like "*mysql*"}
```

#### ب. إذا كان متوقفاً، شغّله:
- افتح Services (services.msc)
- ابحث عن MySQL
- اضغط Start

#### ج. تحقق من ملف .env:
افتح `.env` وتأكد من:
```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password_here
DB_NAME=license_plate_marketplace
```

### 3. إعداد قاعدة البيانات:

#### الطريقة 1: استخدام السكريبت (موصى به)
```bash
node setup_database.js
```

#### الطريقة 2: يدوياً
```bash
# افتح MySQL Command Line
mysql -u root -p

# ثم شغّل:
CREATE DATABASE license_plate_marketplace CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE license_plate_marketplace;
SOURCE database/schema.sql;
SOURCE database/mock_data.sql;
```

### 4. إذا لم يكن MySQL مثبتاً:

**الخيار الأسهل: XAMPP**
1. حمّل من: https://www.apachefriends.org/
2. ثبّت وشغّل MySQL من XAMPP Control Panel
3. استخدم phpMyAdmin لإنشاء قاعدة البيانات

**أو استخدم قاعدة بيانات سحابية:**
- PlanetScale (مجاني)
- Railway Database (مجاني)

---

## بعد الإعداد:

```bash
# شغّل Backend
node server.js

# في terminal آخر
cd client
npm start
```

---

## استكشاف الأخطاء:

### خطأ: "Access denied"
- تحقق من كلمة مرور root في `.env`
- جرب كلمة مرور فارغة: `DB_PASSWORD=`

### خطأ: "Can't connect to MySQL server"
- تأكد من تشغيل MySQL
- تحقق من `DB_HOST` في `.env`

### خطأ: "Unknown database"
- شغّل `node setup_database.js`
- أو أنشئ قاعدة البيانات يدوياً

