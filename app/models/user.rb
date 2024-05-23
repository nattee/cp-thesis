class User < ApplicationRecord
  has_secure_password

  validates :login, presence: true

  enum role: {student: 0, admin: 1, lecturer: 2}, _prefix: :role
end
