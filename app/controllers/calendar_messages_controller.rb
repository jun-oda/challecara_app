class CalendarMessagesController < ApplicationController
  def index
    #@calendar = Calendar.find(params[:id])
    @messages = CalendarMessage.find_by(calendar_id: params[:id])
    #↑userとcalendar_idが一致するCalendarMessageモデルが返ってくる？
    @calendar_message = CalendarMessage.new
    #message保存用のdb（CalendarMessageモデル）新規作成？
    @allmessages = CalendarMessage.select("message")
  end

  def create
    @calendar_message = CalendarMessage.create(calendar_message_params)
  #任意のmessagedb（CalendarMessageモデル）にmessageを追加？
    redirect_to calendar_calendar_messages_path
  end

  def destroy
  end

  def calendar_message_params
    params.require(:calendar_message).permit(:message)
    .merge(user_id: current_user.id, calendar_id: params[:calendar_id])
  end
end
