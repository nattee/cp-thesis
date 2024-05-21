class User < ApplicationRecord
  has_secure_password

  validates :login, presence: true

  enum role: {default: 0, admin: 1}
end
