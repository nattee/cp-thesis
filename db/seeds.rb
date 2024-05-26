# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

def seed_program
  Program.find_or_create_by(id: 1).update(degree: 'วท.ม.', name: 'วิทยาศาสตร์คอมพิวเตอร์')
  Program.find_or_create_by(id: 2).update(degree: 'วท.ม.', name: 'วิทยาศาสตร์คอมพิวเตอร์ (ภาคนอกเวลาราชการ)')
  Program.find_or_create_by(id: 3).update(degree: 'วท.ม.', name: 'วิศวกรรมซอฟต์แวร์  (แผน ก)')
  Program.find_or_create_by(id: 4).update(degree: 'วท.ม.', name: 'วิศวกรรมซอฟต์แวร์  (แผน ก ภาคนอกเวลาราชการ)')
  Program.find_or_create_by(id: 5).update(degree: 'วศ.ม.', name: 'วิศวกรรมคอมพิวเตอร์ แบบ ก 1')
  Program.find_or_create_by(id: 6).update(degree: 'วศ.ม.', name: 'วิศวกรรมคอมพิวเตอร์ แบบ ก 2')
  Program.find_or_create_by(id: 7).update(degree: 'วศ.ด.', name: 'วิศวกรรมคอมพิวเตอร์ แบบ 2.1 (ตรีต่อเอก)')
  Program.find_or_create_by(id: 8).update(degree: 'วศ.ด.', name: 'วิศวกรรมคอมพิวเตอร์ แบบ 2.2 (โทต่อเอก)')
end

def seed_student
  Student.find_or_create_by(cuid: 6670123421,name: 'นายสมชาย ใจดี',program_id:8)
  Student.find_or_create_by(cuid: 6379999921,name: 'น.ส.สมหญิง ขยันเรียน',program_id:1)
end

def seed_faculty
  Faculty.find_or_create_by(name: 'อาจารย์ 1')
  Faculty.find_or_create_by(name: 'อาจารย์ 2')
  Faculty.find_or_create_by(name: 'อาจารย์ 3')
  Faculty.find_or_create_by(name: 'อาจารย์ AA')
  Faculty.find_or_create_by(name: 'อาจารย์ BB')
  Faculty.find_or_create_by(name: 'อาจารย์ CC')

end

def seed_user
  User.find_or_create_by(login: 'student').update(name: 'student', role: 0,password: 'student', student: Student.first)
  User.find_or_create_by(login: 'student2').update(name: 'student2', role: 0,password: 'student', student: Student.second)
  User.find_or_create_by(login: 'staff').update(name: 'staff', role: 1,password: 'staff')
  User.find_or_create_by(login: 'faculty').update(name: 'faculty', role: 2,password: 'faculty', faculty: Faculty.first)
  User.find_or_create_by(login: 'faculty2').update(name: 'faculty', role: 2,password: 'faculty', faculty: Faculty.last)
end

seed_program
seed_student
seed_faculty
seed_user
