class Party < ApplicationRecord
  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations
end
