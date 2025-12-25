// سكريبت لإعداد قاعدة البيانات تلقائياً
const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
require('dotenv').config();

async function setupDatabase() {
  let connection;
  
  try {
    // الاتصال بدون تحديد قاعدة البيانات
    connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
    });

    console.log('✅ تم الاتصال بـ MySQL بنجاح');

    // إنشاء قاعدة البيانات إذا لم تكن موجودة
    const dbName = process.env.DB_NAME || 'license_plate_marketplace';
    await connection.query(`CREATE DATABASE IF NOT EXISTS ${dbName} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci`);
    console.log(`✅ تم إنشاء/التحقق من قاعدة البيانات: ${dbName}`);

    // استخدام قاعدة البيانات
    await connection.query(`USE ${dbName}`);

    // قراءة وتشغيل ملف schema.sql
    const schemaPath = path.join(__dirname, 'database', 'schema.sql');
    if (fs.existsSync(schemaPath)) {
      const schema = fs.readFileSync(schemaPath, 'utf8');
      // تقسيم SQL إلى أوامر منفصلة
      const statements = schema
        .split(';')
        .map(s => s.trim())
        .filter(s => s.length > 0 && !s.startsWith('--') && !s.startsWith('/*'));

      for (const statement of statements) {
        if (statement.length > 10) { // تجاهل الأوامر الفارغة
          try {
            await connection.query(statement);
          } catch (err) {
            // تجاهل الأخطاء المتعلقة بالجداول الموجودة
            if (!err.message.includes('already exists') && !err.message.includes('Duplicate')) {
              console.warn('تحذير:', err.message);
            }
          }
        }
      }
      console.log('✅ تم إنشاء الجداول بنجاح');
    }

    // قراءة وتشغيل ملف mock_data.sql
    const mockDataPath = path.join(__dirname, 'database', 'mock_data.sql');
    if (fs.existsSync(mockDataPath)) {
      const mockData = fs.readFileSync(mockDataPath, 'utf8');
      const statements = mockData
        .split(';')
        .map(s => s.trim())
        .filter(s => s.length > 0 && !s.startsWith('--') && !s.startsWith('/*'));

      for (const statement of statements) {
        if (statement.length > 10) {
          try {
            await connection.query(statement);
          } catch (err) {
            // تجاهل الأخطاء المتعلقة بالبيانات المكررة
            if (!err.message.includes('Duplicate') && !err.message.includes('already exists')) {
              console.warn('تحذير في البيانات التجريبية:', err.message);
            }
          }
        }
      }
      console.log('✅ تم إضافة البيانات التجريبية بنجاح');
    }

    console.log('\n🎉 تم إعداد قاعدة البيانات بنجاح!');
    console.log('\nالحسابات التجريبية:');
    console.log('  مشترين: 0501111111, 0502222222, 0506666666');
    console.log('  بائعين: 0503333333, 0504444444, 0505555555, 0507777777');
    console.log('  أدمن: 0500000000\n');

  } catch (error) {
    console.error('❌ خطأ في إعداد قاعدة البيانات:', error.message);
    console.error('\nتأكد من:');
    console.error('1. MySQL يعمل');
    console.error('2. بيانات الاتصال في ملف .env صحيحة');
    console.error('3. لديك صلاحيات إنشاء قواعد البيانات\n');
    process.exit(1);
  } finally {
    if (connection) {
      await connection.end();
    }
  }
}

setupDatabase();

