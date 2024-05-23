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

def seed_student
  Student.find_or_create_by(cuid: 6670123421,name: 'นายสมชาย ใจดี')
  Student.find_or_create_by(cuid: 6379999921,name: 'น.ส.สมหญิง ขยันเรียน')
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
  User.find_or_create_by(login: 'staff').update(name: 'staff', role: 1,password: 'staff')
  User.find_or_create_by(login: 'faculty').update(name: 'faculty', role: 2,password: 'faculty', faculty: Faculty.first)
end

seed_user
seed_student
seed_faculty
