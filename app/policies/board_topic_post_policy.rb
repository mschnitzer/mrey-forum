class BoardTopicPostPolicy < ApplicationPolicy
  def new?
    @user && (@user.admin || @record.board_topic.board.name != 'Intern')
  end

  def create?
    new?
  end
end
