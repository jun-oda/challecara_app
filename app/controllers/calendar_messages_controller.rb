class CalendarMessagesController < ApplicationController
  before_action :authenticate_user!
  def index    
    @calendar_message = CalendarMessage.new
    #message保存用のdb（CalendarMessageモデル）新規作成？
    @allmessages = CalendarMessage.select(:message).where(calendar_id: params[:calendar_id])
    #予定ごとのメッセージ履歴を引っ張る
  end

  def create
    @calendar_message = CalendarMessage.create(calendar_message_params)
  #任意のmessagedb（CalendarMessageモデル）にmessageを追加？
    redirect_to calendar_calendar_messages_path
  end

  def destroy
    @calendar_message = Calendar.find(params[:id])
    @calendar_message.destroy
    redirect_to calendars_path, notice:"削除しました"
  end

  def calendar_message_params
    params.require(:calendar_message).permit(:message, :image)
    .merge(user_id: current_user.id, calendar_id: params[:calendar_id])
  end
end
