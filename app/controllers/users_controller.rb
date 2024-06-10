class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def set_follow
    @user = User.find(params[:id])
    @follow = current_user.follows.find_by(second_user: @user)
    if @follow
      Follow.delete(@follow)
    else
      Follow.create(first_user: current_user, second_user: @user)
    end
  end
end
