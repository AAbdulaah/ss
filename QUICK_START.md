# دليل البدء السريع

## 1. إعداد قاعدة البيانات

```bash
# إنشاء قاعدة البيانات
mysql -u root -p
CREATE DATABASE license_plate_marketplace CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
EXIT;

# تشغيل ملف الجداول
mysql -u root -p license_plate_marketplace < database/schema.sql

# إضافة البيانات التجريبية
mysql -u root -p license_plate_marketplace < database/mock_data.sql
```

## 2. تحديث ملف .env

افتح ملف `.env` وعدّل بيانات قاعدة البيانات:
```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=license_plate_marketplace
```

## 3. تشغيل المشروع

### Terminal 1 - Backend:
```bash
npm run dev
```

### Terminal 2 - Frontend:
```bash
cd client
npm start
```

## 4. الحسابات التجريبية

### مشترين:
- **0501111111** - أحمد المشتري
- **0502222222** - محمد المشتري
- **0506666666** - فاطمة المشتري

### بائعين:
- **0503333333** - خالد البائع
- **0504444444** - سعد البائع
- **0505555555** - علي البائع
- **0507777777** - نورا البائع

### أدمن:
- **0500000000** - مدير النظام

## ملاحظة: OTP في التطوير

في بيئة التطوير، سيتم طباعة رمز OTP في كونسول Backend عند إرسال OTP.
استخدم أي رمز 6 أرقام للاختبار (مثل: 123456) أو تحقق من الكونسول.

## الوصول للتطبيق

- Frontend: http://localhost:3000
- Backend API: http://localhost:5000

