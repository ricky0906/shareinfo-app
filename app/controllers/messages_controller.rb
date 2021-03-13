class MessagesController < ApplicationController
  before_action :find_room, only: [:index, :create]
  before_action :display_room_messages, only: :index
  def index
    @message = Message.new
  end

  def create
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      display_room_messages
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def find_room
    @room = Room.find(params[:room_id])
  end

  def display_room_messages
    @messages = @room.messages.includes(:user)
    @rooms = Room.all
  end
end
