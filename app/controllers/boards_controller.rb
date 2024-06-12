class BoardsController < ApplicationController
  def new
    @board = Board.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @board = Board.new(board_params)
    @board.user = @user
    if @board.save
      redirect_to dashboard_path, notice: 'Your board was successfuly created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def board_params
    params.require(:board).permit(:image, :brand, :shape, :width, :length, :thickness)
  end
end
