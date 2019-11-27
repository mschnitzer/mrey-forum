class BoardTopicsController < ApplicationController
  # GET /boards/:id/topics/new
  def new
    authorize BoardTopic

    Board.find(params[:id])

    @board_topic = BoardTopic.new
    @board_topic_post = BoardTopicPost.new
  end

  # POST /boards/:id/topics/new
  def create
    authorize BoardTopic

    board = Board.find(params[:id])

    ApplicationRecord.transaction do
      @board_topic = BoardTopic.new(
        board:    board,
        title:    params[:board_topic][:title],
        username: params[:board_topic][:username]
      )

      @board_topic_post = BoardTopicPost.new(
        username: params[:board_topic][:username],
        text:     params[:board_topic][:board_topic_post][:text]
      )

      if @board_topic.save
        @board_topic_post.board_topic = @board_topic

        if @board_topic_post.save
          @board_topic = BoardTopic.new
          @board_topic_post = BoardTopicPost.new

          flash.now[:ok] = 'saved'
        else
          flash.now[:error] = @board_topic_post.errors.full_messages.to_sentence
          raise ActiveRecord::Rollback
        end
      else
        flash.now[:error] = @board_topic.errors.full_messages.to_sentence
      end
    end

    render :new
  end

  def show
    @board_topic = BoardTopic.find(params[:id])

    if @board_topic.to_param != params[:id] || @board_topic.board.to_param != params[:board_id]
      redirect_to board_topics_show_path(@board_topic.board, @board_topic)
      return
    end

    @posts = @board_topic.board_topic_posts
  end
end
