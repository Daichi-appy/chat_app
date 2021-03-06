class RoomsController < ApplicationController

  def index
    @users = current_user.followings
    # それぞれのユーザーのメッセージを取ってくる
    # current_user_id = current_user.id
    # @users フォローしている人それぞれのID
    # room_id = 
    # @message = Message.where(user_id: 自分, room_id:)
  end


  def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    if user_rooms.nil?
      @room = Room.new
      @room.save
      UserRoom.create(user_id: @user.id, room_id: @room.id)
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
    else
      @room = user_rooms.room
    end

    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

end
