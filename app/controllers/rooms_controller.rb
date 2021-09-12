class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order(:id)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user).order(:id).last(100)
    @message = current_user.messages.build
  end

  def new
    @room = Room.new
    @room.users << current_user
  end

  def create
    @room =Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  private

    def room_params
      params.require(:room).permit(:name).merge(user_ids: current_user.id)
    end
end
