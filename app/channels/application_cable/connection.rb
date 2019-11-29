module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :user

    def connect
      self.user = identify_user
    end

    private

    def identify_user
      user_data = cookies.encrypted[:forum_account]

      if user_data
        user_data = JSON.parse(cookies.encrypted[:forum_account])
        return User.find_by(id: user_data['user_id']) if Date.parse(user_data['lifetime']) > Time.now
      end

      nil
    end
  end
end
