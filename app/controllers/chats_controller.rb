class ChatsController < ApplicationController


  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
    redirect_to request.referer
  end

  private

    def chat_params
      params.require(:chat).permit(:message, :room_id)
    end
end
