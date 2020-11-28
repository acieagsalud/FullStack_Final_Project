class User < ApplicationRecord
  belongs_to :province
  has_secure_password
end
