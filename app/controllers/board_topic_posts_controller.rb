class BoardTopicPostsController < ApplicationController
  def list
    @board_topic = BoardTopic.find(params[:id])
    @posts = @board_topic.board_topic_posts

    render layout: false
  end

  def create
    authorize BoardTopicPost

    user = User.current

    post = BoardTopicPost.new(
      board_topic: BoardTopic.find(params[:id]),
      user:        user,
      username:    user.username,
      text:        params[:board_topic_post][:text]
    )

    post.file.attach(params[:board_topic_post][:file])

    if post.save
      notify_on_post_update(post)
      flash[:success] = 'post created'
    else
      flash[:error] = post.errors.full_messages.to_sentence
    end

    redirect_to board_topics_show_path(post.board_topic.board, post.board_topic)
  end

  def delete
    post = BoardTopicPost.find(params[:id])
    authorize post

    post.destroy!
    notify_on_post_update(post)

    flash[:success] = 'post deleted'
    redirect_back fallback_location: root_path
  end

  # DELETE /posts/:id/file
  def delete_file
    post = BoardTopicPost.find(params[:id])
    authorize post

    post.file.purge
    notify_on_post_update(post)

    flash[:success] = 'file deleted'
    redirect_back fallback_location: root_path
  end

  private

  def notify_on_post_update(post)
    BoardTopicNotificationChannel.broadcast_to(
      post.board_topic,
      { event: 'posts_updated', query_path: board_topic_posts_list_path(post.board_topic) }
    )
  end
end
