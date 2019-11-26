class BoardTopicsController < ApplicationController
  # GET /boards/:id/topics/new
  def new
    Board.find(params[:id])

    @board_topic = BoardTopic.new
    @board_topic_post = BoardTopicPost.new
  end

  # POST /boards/:id/topics/new
  def create
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
end
