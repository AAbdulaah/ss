# نظام بيع لوحات السيارات في السعودية

نظام متكامل لإدارة بيع وشراء لوحات السيارات في السعودية.

## المميزات

### واجهة المشتري
- تسجيل دخول برقم الجوال + OTP
- عرض اللوحات المتاحة مع فلترة
- إجراء شراء مع حساب نسبة المنصة (2%)
- متابعة الطلبات
- إشعارات
- تقييم البائع

### واجهة البائع
- تسجيل دخول برقم الجوال
- إضافة لوحات جديدة مع رفع المستندات
- إدارة اللوحات
- متابعة الطلبات الواردة
- إحصائيات المبيعات والأرباح
- التقييمات

### واجهة الأدمن
- إدارة المستخدمين
- إدارة اللوحات ومراجعة المستندات
- إدارة العمليات المالية والتقارير
- إدارة الشكاوى
- إعدادات النظام

## التثبيت

### 1. تثبيت المتطلبات
```bash
npm install
```

### 2. إعداد قاعدة البيانات
- قم بإنشاء قاعدة بيانات MySQL
- قم بتشغيل ملف `database/schema.sql` لإنشاء الجداول

### 3. إعداد ملف .env
انسخ ملف `.env.example` إلى `.env` واملأ البيانات:
```env
PORT=5000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=license_plate_marketplace
JWT_SECRET=your-secret-key
```

### 4. تشغيل السيرفر
```bash
npm start
# أو للتطوير
npm run dev
```

## API Endpoints

### Authentication
- `POST /api/auth/send-otp` - إرسال OTP
- `POST /api/auth/verify-otp` - التحقق من OTP وتسجيل الدخول
- `GET /api/auth/me` - معلومات المستخدم الحالي

### Plates
- `GET /api/plates/available` - جلب اللوحات المتاحة
- `GET /api/plates/:id` - تفاصيل لوحة
- `POST /api/plates` - إضافة لوحة جديدة (بائع)

### Orders
- `POST /api/orders` - إنشاء طلب شراء
- `GET /api/orders/buyer/my-orders` - طلبات المشتري
- `GET /api/orders/seller/my-orders` - طلبات البائع

### Admin
- `GET /api/admin/users` - جلب المستخدمين
- `GET /api/admin/plates` - جلب اللوحات
- `GET /api/admin/orders` - جلب الطلبات
- `GET /api/admin/reports/earnings` - تقارير الأرباح

## البنية

```
├── config/          # إعدادات قاعدة البيانات
├── database/        # ملفات قاعدة البيانات
├── middleware/      # Middleware (المصادقة)
├── routes/          # Routes API
├── utils/           # Utilities (OTP, Upload)
├── uploads/         # الملفات المرفوعة
└── server.js        # نقطة البداية
```

## ملاحظات

- قاعدة البيانات محلية داخل السيرفر
- الملفات المرفوعة محفوظة في مجلد `uploads/`
- المستندات مرئية للأدمن فقط
- نسبة المنصة الافتراضية: 2%

