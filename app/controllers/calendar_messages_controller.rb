class CalendarMessagesController < ApplicationController
  def index
    #@calendar = Calendar.find(params[:id])
    @messages = CalendarMessage.find_by(calendar_id: params[:id])
    @calendar_message = CalendarMessage.new
  end

  def create
    @calendar_message = CalendarMessage.create(calendar_message_params)
    redirect_to calendar_calendar_messages_path
  end

  def destroy
    @calendar_message = Calendar.find(params[:id])
    @calendar_message.destroy
    redirect_to calendars_path, notice:"削除しました"
  end

  def calendar_message_params
    params.require(:calendar_message).permit(:message)
    .merge(user_id: current_user.id, calendar_id: params[:calendar_id])
  end
end
