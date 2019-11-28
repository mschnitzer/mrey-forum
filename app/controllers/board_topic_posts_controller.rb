class BoardTopicPostsController < ApplicationController
  def create
    authorize BoardTopicPost

    user = User.current

    post = BoardTopicPost.new(
      board_topic: BoardTopic.find(params[:id]),
      user:        user,
      username:    user.username,
      text:        params[:board_topic_post][:text]
    )

    if post.save
      flash[:success] = 'post created'
    else
      flash[:error] = post.errors.full_messages.to_sentence
    end

    redirect_to board_topics_show_path(post.board_topic.board, post.board_topic)
  end
end
