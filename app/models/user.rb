class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :password
  validates_presence_of :password_confirmation, on: :create
end
