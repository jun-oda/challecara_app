class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = current_user.messages.create!(message_params)
    ActionCable.server.broadcast "room_channel", message: @message.template
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(room_id: @room.id)
  end
end
