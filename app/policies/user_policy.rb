class UserPolicy < ApplicationPolicy
  def logout?
    @user
  end
end
