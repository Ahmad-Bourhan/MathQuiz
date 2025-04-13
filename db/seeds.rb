# db/seeds.rb

# حذف جميع المستخدمين السابقين (اختياري)
User.delete_all

# إنشاء مستخدم إداري لتجربة تسجيل الدخول
User.create!(
  email: "admin@example.com",
  password: "password123",
  password_confirmation: "password123"
)

puts "✅ Admin user created: admin@example.com / password123"
