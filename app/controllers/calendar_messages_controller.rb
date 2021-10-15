class CalendarMessagesController < ApplicationController
  def index
    @messages = CalendarMessage.find_by(calendar_id: params[:id])
  end

  def create
    @message = CalendarMessage.new(calendar_message_params)

    if @message.save
      redirect_to calendar_calendar_messages_path
    else
      render calendar_calendar_messages_path
    end
  end

  def destroy
  end

  def calendar_message_params
    params.require(:calendar_message).permit(:message)
.merge(user_id: current_user.id, calendar_id: params[:id])
  end
end
