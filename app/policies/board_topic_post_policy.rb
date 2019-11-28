class BoardTopicPostPolicy < ApplicationPolicy
  def new?
    @user
  end

  def create?
    new?
  end

  def delete?
    @user && @record && (@user == @record.user || @user.admin || @user.moderator)
  end

  def delete_file?
    delete? && @record.file.attached?
  end
end
