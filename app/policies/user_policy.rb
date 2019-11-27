class UserPolicy < ApplicationPolicy
  def login?
    @user.nil?
  end

  def login_perform?
    login?
  end

  def logout?
    @user
  end
end
