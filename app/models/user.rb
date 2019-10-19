class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /@/,
    message: "must be valid" }
  validates :password, presence: true, length: { minimum: 6 }
end
