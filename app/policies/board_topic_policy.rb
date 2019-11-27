class BoardTopicPolicy < ApplicationPolicy
  def new?
    @user
  end

  def create?
    new?
  end
end
