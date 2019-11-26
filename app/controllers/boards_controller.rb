class BoardsController < ApplicationController
  def index
    @boards = Board.where(board: nil)
  end

  def show
    @board = Board.find(params[:id])
    @is_main_category = !@board.board
  end
end
