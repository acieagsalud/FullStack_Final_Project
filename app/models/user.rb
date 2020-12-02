class User < ApplicationRecord
  belongs_to :province
  has_secure_password

  validates :username, :password_digest, :email, presence: true
end
