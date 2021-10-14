class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :party

  enum role: %w[attendee host]
end
