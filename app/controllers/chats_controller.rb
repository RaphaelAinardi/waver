class ChatsController < ApplicationController
  def index
    @chats = Chat.where("first_user_id = ? OR second_user_id = ?", current_user.id, current_user.id)
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to @chat
    else
      render :new
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:first_user_id, :second_user_id)
  end
end
