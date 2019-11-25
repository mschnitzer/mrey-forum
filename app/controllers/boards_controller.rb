class BoardsController < ApplicationController
  def index
    @current_time = Time.now
  end
end
