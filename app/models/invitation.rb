class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :party

  enum role: { 'attendee' => 0, 'host' => 1 }

  scope :create_host, ->(host_id) {
    find_by(user_id: host_id).host!
  }
end
