class Message < ActiveRecord::Base

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :subject, presence: true
  validates :body, presence: true
end
