# دليل التثبيت والتشغيل

## المتطلبات الأساسية

1. **Node.js** (الإصدار 14 أو أحدث)
2. **MySQL** (الإصدار 5.7 أو أحدث)
3. **npm** أو **yarn**

## خطوات التثبيت

### 1. تثبيت المتطلبات

```bash
# تثبيت متطلبات Backend
npm install

# تثبيت متطلبات Frontend
cd client
npm install
cd ..
```

### 2. إعداد قاعدة البيانات

1. افتح MySQL و أنشئ قاعدة بيانات جديدة:
```sql
CREATE DATABASE license_plate_marketplace CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

2. قم بتشغيل ملف SQL لإنشاء الجداول:
```bash
mysql -u root -p license_plate_marketplace < database/schema.sql
```

### 3. إعداد ملف .env

أنشئ ملف `.env` في المجلد الرئيسي واملأه بالبيانات التالية:

```env
PORT=5000
NODE_ENV=development

DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=license_plate_marketplace

JWT_SECRET=your-secret-key-change-this-in-production

# OTP Configuration (اختياري - للتطوير يمكن تركها فارغة)
TWILIO_ACCOUNT_SID=
TWILIO_AUTH_TOKEN=
TWILIO_PHONE_NUMBER=

PLATFORM_FEE_PERCENTAGE=2
MAX_FILE_SIZE=5242880
UPLOAD_PATH=./uploads
```

### 4. إنشاء مجلد التخزين

```bash
mkdir uploads
mkdir uploads/identity
mkdir uploads/registration
```

### 5. تشغيل التطبيق

#### في بيئة التطوير:

**Terminal 1 - Backend:**
```bash
npm run dev
```

**Terminal 2 - Frontend:**
```bash
cd client
npm start
```

#### في بيئة الإنتاج:

**بناء Frontend:**
```bash
cd client
npm run build
cd ..
```

**تشغيل Backend:**
```bash
npm start
```

## الوصول للتطبيق

- **Frontend:** http://localhost:3000
- **Backend API:** http://localhost:5000

## حساب الأدمن الافتراضي

بعد تشغيل ملف `schema.sql`، سيتم إنشاء حساب أدمن افتراضي:
- **رقم الجوال:** 0500000000
- **النوع:** admin

يمكنك استخدام هذا الحساب لتسجيل الدخول (ستحتاج إلى إرسال OTP).

## ملاحظات مهمة

1. **OTP في بيئة التطوير:** في بيئة التطوير، سيتم طباعة رمز OTP في الكونسول بدلاً من إرساله عبر SMS.

2. **رفع الملفات:** تأكد من أن مجلد `uploads` لديه صلاحيات الكتابة.

3. **قاعدة البيانات:** تأكد من أن MySQL يعمل وأن بيانات الاتصال صحيحة في ملف `.env`.

4. **JWT Secret:** يجب تغيير `JWT_SECRET` في بيئة الإنتاج إلى قيمة عشوائية قوية.

## استكشاف الأخطاء

### خطأ في الاتصال بقاعدة البيانات
- تأكد من أن MySQL يعمل
- تحقق من بيانات الاتصال في `.env`
- تأكد من أن قاعدة البيانات موجودة

### خطأ في رفع الملفات
- تأكد من وجود مجلد `uploads` وصلاحيات الكتابة
- تحقق من `MAX_FILE_SIZE` في `.env`

### خطأ في OTP
- في بيئة التطوير، تحقق من الكونسول لرؤية رمز OTP
- في الإنتاج، تأكد من إعداد Twilio بشكل صحيح

