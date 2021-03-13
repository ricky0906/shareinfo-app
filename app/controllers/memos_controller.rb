class MemosController < ApplicationController
  def index
    @memo = Memo.new
    @room = Room.find(params[:room_id])
    @memos = @room.memos.includes(:user)
    @rooms = Room.all
  end

  def create
    @room = Room.find(params[:room_id])
    @memo = @room.memos.new(memo_params)
    if @memo.save
      redirect_to room_memos_path(@room)
    else
      @memos = @room.memos.includes(:user)
      @rooms = Room.all
      render :index
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:content).merge(user_id: current_user.id)
  end
end
