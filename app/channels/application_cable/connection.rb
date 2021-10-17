module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user

      logger.add_tags 'ActionCable', current_user.email
    end

    private

    def find_verified_user
      session_key = cookies.encrypted[Rails.application.config.session_options[:key]]
      verified_id = session_key['user_id']
      verified_user = User.find_by(id: verified_id)

      return reject_unauthorized_connect unless verified_user
      verified_user
    end
  end
end
