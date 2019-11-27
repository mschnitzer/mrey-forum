class BoardsController < ApplicationController
  def index
    @boards = Board.where(board: nil)
  end

  def show
    @board = Board.find(params[:id])

    if @board.to_param != params[:id]
      redirect_to boards_show_path(@board)
      return
    end

    @is_main_category = !@board.board
    @topics = @board.board_topics
  end
end
