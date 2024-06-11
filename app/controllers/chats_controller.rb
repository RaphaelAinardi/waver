class ChatsController < ApplicationController
  def index
    @chats = Chat.where("first_user_id = ? OR second_user_id = ?", current_user.id, current_user.id)
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

  def create
    # Find or create the chat between current_user and the other user
    @chat = Chat.between(current_user.id, params[:user_id]).first_or_initialize do |chat|
      chat.first_user_id = current_user.id
      chat.second_user_id = params[:user_id]
    end

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
