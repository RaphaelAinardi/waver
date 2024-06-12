class BoardsController < ApplicationController
  def new
    @board = Board.new
    @user = User.find(params[:user_id])
  end

  def create
    @board = Board.new(board_params)
    @board.user = User.find(params[:user_id])
    if @board.save
      redirect_to dashboard_path, notice: 'Your board was successfuly created'
    else
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:brand, :shape, :width, :lenght, :thickness)
  end
end
