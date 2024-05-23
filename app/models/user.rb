class User < ApplicationRecord
  has_secure_password

  belongs_to :student, optional: true
  belongs_to :faculty, optional: true

  validates :login, presence: true

  enum role: {student: 0, staff: 1, faculty: 2}, _prefix: :role
end
