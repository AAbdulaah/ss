# إضافة البيانات التجريبية

## خطوات إضافة البيانات التجريبية

### 1. تأكد من إنشاء قاعدة البيانات والجداول أولاً:

```bash
mysql -u root -p
```

ثم في MySQL:
```sql
CREATE DATABASE IF NOT EXISTS license_plate_marketplace CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE license_plate_marketplace;
SOURCE database/schema.sql;
```

### 2. إضافة البيانات التجريبية:

```bash
mysql -u root -p license_plate_marketplace < database/mock_data.sql
```

أو في MySQL مباشرة:
```sql
USE license_plate_marketplace;
SOURCE database/mock_data.sql;
```

### 3. التحقق من البيانات:

```sql
SELECT * FROM users;
SELECT * FROM plates;
SELECT * FROM orders;
```

---

## ملاحظة مهمة

إذا واجهت خطأ `ON DUPLICATE KEY UPDATE`، فهذا يعني أن البيانات موجودة بالفعل. يمكنك:

1. **حذف البيانات القديمة:**
```sql
DELETE FROM orders;
DELETE FROM plates;
DELETE FROM users WHERE phone != '0500000000';
```

2. **ثم إعادة تشغيل ملف mock_data.sql**

أو ببساطة تجاهل الخطأ إذا كانت البيانات موجودة بالفعل.

---

## البيانات المضافة

- ✅ 7 مستخدمين (3 مشترين، 4 بائعين)
- ✅ 10 لوحات (9 مفعلة، 1 معلقة)
- ✅ 3 طلبات (1 مكتمل، 1 قيد النقل، 1 بانتظار النقل)
- ✅ 4 إشعارات
- ✅ 1 تقييم

