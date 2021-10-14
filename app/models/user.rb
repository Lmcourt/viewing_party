class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates :password_confirmation, presence: { on: :create }

  has_many :invitations, dependent: :destroy
  has_many :parties, through: :invitations
end
