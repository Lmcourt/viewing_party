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

  def formatted_duration
    hours = duration / 60
    minutes = duration % 60
    one_or_more = hours > 1 ? 'hours' : 'hour'
    "#{hours} #{one_or_more} #{minutes} minutes"
  end
end
