class User < ActiveRecord::Base
  validates :username, presence: true
  validates :password, length: { minimum: 6 }
  has_secure_password
end
