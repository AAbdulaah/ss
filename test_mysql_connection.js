// اختبار الاتصال بـ MySQL
const mysql = require('mysql2/promise');
require('dotenv').config();

async function testConnection() {
  console.log('🔍 اختبار الاتصال بـ MySQL...\n');
  console.log('الإعدادات الحالية:');
  console.log(`  Host: ${process.env.DB_HOST || 'localhost'}`);
  console.log(`  User: ${process.env.DB_USER || 'root'}`);
  console.log(`  Password: ${process.env.DB_PASSWORD ? '***' : '(فارغة)'}`);
  console.log(`  Database: ${process.env.DB_NAME || 'license_plate_marketplace'}\n`);

  // محاولة الاتصال بدون قاعدة بيانات أولاً
  try {
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      port: 3306
    });

    console.log('✅ تم الاتصال بـ MySQL بنجاح!\n');
    
    // التحقق من قواعد البيانات الموجودة
    const [databases] = await connection.query('SHOW DATABASES');
    console.log('قواعد البيانات الموجودة:');
    databases.forEach(db => {
      console.log(`  - ${db.Database}`);
    });
    
    await connection.end();
    return true;
  } catch (error) {
    console.error('❌ فشل الاتصال:', error.message);
    console.error('\nالحلول المقترحة:');
    console.error('1. تأكد من تشغيل MySQL/XAMPP');
    console.error('2. جرب كلمة مرور مختلفة في ملف .env');
    console.error('3. تحقق من أن MySQL يعمل على المنفذ 3306');
    console.error('4. إذا كنت تستخدم XAMPP، تأكد من تشغيل MySQL من XAMPP Control Panel\n');
    return false;
  }
}

testConnection();

