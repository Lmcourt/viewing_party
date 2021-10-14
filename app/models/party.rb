class Party < ApplicationRecord
  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations

  scope :hosted, ->(user_id) {
    joins(:invitations)
      .merge(Invitation.host)
      .merge(Invitation.find_host(user_id))
      .group(:id)
  }
end
