# إعداد MySQL

## المشكلة: MySQL غير متاح

يبدو أن MySQL غير مثبت أو غير متاح في PATH. إليك الحلول:

## الحل 1: تثبيت MySQL (موصى به)

### Windows:
1. حمّل MySQL من: https://dev.mysql.com/downloads/installer/
2. اختر "MySQL Installer for Windows"
3. أثناء التثبيت، اختر "Developer Default"
4. احفظ كلمة المرور التي ستضعها لـ root
5. تأكد من إضافة MySQL إلى PATH

### بعد التثبيت:
1. افتح MySQL Command Line Client
2. أدخل كلمة مرور root
3. شغّل الأوامر التالية:

```sql
CREATE DATABASE license_plate_marketplace CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

4. عدّل ملف `.env` وأضف كلمة مرور MySQL:
```
DB_PASSWORD=your_mysql_password
```

5. شغّل:
```bash
node setup_database.js
```

---

## الحل 2: استخدام XAMPP (أسهل)

1. حمّل XAMPP من: https://www.apachefriends.org/
2. ثبّت XAMPP
3. شغّل XAMPP Control Panel
4. اضغط Start على MySQL
5. افتح phpMyAdmin من المتصفح: http://localhost/phpmyadmin
6. أنشئ قاعدة بيانات جديدة: `license_plate_marketplace`
7. في ملف `.env`:
```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=  (فارغة إذا لم تضع كلمة مرور)
DB_NAME=license_plate_marketplace
```

8. شغّل:
```bash
node setup_database.js
```

---

## الحل 3: استخدام قاعدة بيانات سحابية مجانية

### PlanetScale (موصى به):
1. اذهب إلى: https://planetscale.com/
2. أنشئ حساب مجاني
3. أنشئ قاعدة بيانات جديدة
4. انسخ رابط الاتصال
5. عدّل `.env` برابط PlanetScale

### Railway Database:
1. اذهب إلى: https://railway.app/
2. أنشئ حساب
3. أنشئ MySQL Database
4. انسخ بيانات الاتصال
5. عدّل `.env`

---

## التحقق من MySQL:

```bash
# في PowerShell
mysql --version

# أو
Get-Service | Where-Object {$_.Name -like "*mysql*"}
```

إذا لم يعمل، MySQL غير مثبت.

---

## بعد إعداد MySQL:

```bash
# 1. إعداد قاعدة البيانات
node setup_database.js

# 2. تشغيل Backend
node server.js

# 3. في terminal آخر - تشغيل Frontend
cd client
npm start
```

