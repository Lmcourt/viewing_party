class Party < ApplicationRecord
  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations

  scope :hosted, -> {
    joins(:invitations)
      .merge(Invitation.host)
      .group(:id)
  }

  scope :invited, -> {
    joins(:invitations)
      .merge(Invitation.attendee)
      .group(:id)
  }
end
