class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :party

  enum role: %w[attendee host]

  scope :create_host, ->(host_id) {
    find_host(host_id).first.update_attribute(:role, 1)
  }

  scope :find_host, ->(user_id) {
    where(user_id: user_id)
  }
end
