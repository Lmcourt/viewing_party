class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates :password_confirmation, presence: { on: :create }

  has_many :invitations, dependent: :destroy
  has_many :parties, through: :invitations
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: :friend_id
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  has_many :chat_rooms
  has_many :messages, dependent: :destroy

  def all_friends
    friends + inverse_friends
  end
end
