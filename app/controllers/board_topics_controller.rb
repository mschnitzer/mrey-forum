class BoardTopicsController < ApplicationController
  def new
    @board_topic = BoardTopic.new
  end

  def create
    params = board_topic_create_params
    byebug

    @board_topic = BoardTopic.new
    render :new
  end

  private

  def board_topic_create_params
    params.require(:board_topic).permit(:username, :title, board_topic_posts: [:text])
  end
end
