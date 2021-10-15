class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :party

  enum role: %w[attendee host]

  scope :create_host, ->(host_id) {
    find_by(user_id: host_id).host!
  }
end
