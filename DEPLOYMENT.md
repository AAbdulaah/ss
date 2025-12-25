# دليل نشر المشروع

## خيارات الاستضافة

### 1. استضافة Frontend على Netlify

Netlify مناسب لاستضافة واجهة React فقط.

#### خطوات النشر:

1. **بناء المشروع:**
```bash
cd client
npm run build
```

2. **رفع على Netlify:**
   - اذهب إلى [Netlify](https://app.netlify.com/)
   - سجل دخول أو أنشئ حساب
   - اضغط "Add new site" → "Import an existing project"
   - اربط مع GitHub أو ارفع مجلد `client/build` مباشرة

3. **إعداد متغيرات البيئة:**
   - في Netlify Dashboard → Site settings → Environment variables
   - أضف: `REACT_APP_API_URL` = رابط Backend الخاص بك

4. **إعادة البناء:**
   - Netlify سيبني المشروع تلقائياً بعد كل push

---

### 2. استضافة Backend

#### الخيار 1: Railway (موصى به - مجاني)

1. اذهب إلى [Railway](https://railway.app/)
2. سجل دخول بـ GitHub
3. "New Project" → "Deploy from GitHub repo"
4. اختر المشروع
5. أضف متغيرات البيئة:
   - `DB_HOST`, `DB_USER`, `DB_PASSWORD`, `DB_NAME`
   - `JWT_SECRET`
   - `PORT` (سيتم تعيينه تلقائياً)

#### الخيار 2: Render

1. اذهب إلى [Render](https://render.com/)
2. "New" → "Web Service"
3. اربط مع GitHub
4. Build Command: `npm install`
5. Start Command: `node server.js`
6. أضف متغيرات البيئة

#### الخيار 3: Heroku

1. تثبيت Heroku CLI
2. `heroku create your-app-name`
3. `git push heroku main`
4. إضافة متغيرات البيئة عبر Dashboard

---

### 3. استضافة قاعدة البيانات

#### الخيار 1: Railway Database (موصى به)

1. في Railway → "New" → "Database" → "MySQL"
2. ستحصل على رابط الاتصال تلقائياً
3. استخدمه في متغيرات البيئة للـ Backend

#### الخيار 2: PlanetScale (مجاني)

1. اذهب إلى [PlanetScale](https://planetscale.com/)
2. أنشئ قاعدة بيانات جديدة
3. انسخ رابط الاتصال
4. استخدمه في Backend

#### الخيار 3: Render Database

1. في Render → "New" → "PostgreSQL" أو "MySQL"
2. انسخ بيانات الاتصال

---

## إعداد كامل للمشروع

### الخطوة 1: إعداد قاعدة البيانات

```bash
# على السيرفر أو قاعدة البيانات المستضافة
mysql -u user -p database_name < database/schema.sql
```

### الخطوة 2: نشر Backend

**مثال على Railway:**
1. ارفع المشروع على GitHub
2. في Railway → New Project → Deploy from GitHub
3. أضف متغيرات البيئة:
```
DB_HOST=your-db-host
DB_USER=your-db-user
DB_PASSWORD=your-db-password
DB_NAME=your-db-name
JWT_SECRET=your-secret-key
PORT=5000
```

### الخطوة 3: نشر Frontend على Netlify

1. في Netlify → Import project
2. اختر مجلد `client` من GitHub
3. Build settings:
   - Build command: `npm run build`
   - Publish directory: `build`
4. Environment variables:
   - `REACT_APP_API_URL` = رابط Backend (مثال: `https://your-backend.railway.app`)

---

## مثال على الإعداد الكامل

### Backend على Railway:
```
https://license-plate-api.railway.app
```

### Frontend على Netlify:
```
https://license-plate-marketplace.netlify.app
```

### في Netlify Environment Variables:
```
REACT_APP_API_URL=https://license-plate-api.railway.app/api
```

---

## ملاحظات مهمة

1. **CORS:** تأكد من إضافة رابط Netlify في CORS في Backend:
```javascript
// في server.js
app.use(cors({
  origin: ['https://your-app.netlify.app', 'http://localhost:3000']
}));
```

2. **الملفات المرفوعة:** في Railway/Render، استخدم خدمة تخزين خارجية مثل:
   - AWS S3
   - Cloudinary
   - أو استخدم قاعدة بيانات للملفات

3. **HTTPS:** Netlify يوفر HTTPS تلقائياً

4. **Custom Domain:** يمكنك إضافة دومين مخصص في Netlify

---

## بدائل كاملة (All-in-One)

إذا كنت تريد استضافة كل شيء في مكان واحد:

### Render (موصى به)
- Frontend: Static Site
- Backend: Web Service
- Database: PostgreSQL/MySQL
- كل شيء في مكان واحد

### Vercel + Railway
- Frontend: Vercel (مثل Netlify)
- Backend: Railway
- Database: Railway Database

### DigitalOcean App Platform
- Frontend + Backend + Database في مكان واحد
- مدفوع لكن سهل الاستخدام

