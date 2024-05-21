# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def seed_user
  User.find_or_create_by(login: 'admin').update(name: 'admin', role: 1,password: 'admin')
  User.find_or_create_by(login: 'student').update(name: 'student', role: 1,password: 'student')
  User.find_or_create_by(login: 'faculty').update(name: 'faculty', role: 1,password: 'faculty')
end

seed_user
