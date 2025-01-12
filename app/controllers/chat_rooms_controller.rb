class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoomDecorator.decorate_collection(ChatRoom.all)
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @json_object = ChatRoomsSerializer.new(@chat_room).as_json
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.new(chat_room_params)

    if @chat_room.save
      redirect_to chat_room_path(@chat_room), success: 'Chat room created!'
    else
      render 'new'
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
