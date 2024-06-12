class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.user = current_user
    if @message.save
      p @message.user
      p current_user
      ChatChannel.broadcast_to(
        @chat,
        message: render_to_string(partial: "messages/message", locals: { message: @message }),
        sender_id: @message.user.id
      )
      head :ok
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
