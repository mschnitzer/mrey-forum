class ApplicationController < ActionController::Base
  include Pundit

  before_action :identify_user

  def pundit_user
    User.current
  end

  private

  def identify_user
    user_data = cookies.encrypted[:forum_account]

    if user_data
      user_data = JSON.parse(cookies.encrypted[:forum_account])

      if Date.parse(user_data['lifetime']) > Time.now
        User.current = User.find_by(id: user_data['user_id'])
        return
      end
    end

    User.current = nil
  end
end
