class CalendarMessagesController < ApplicationController
  before_action :authenticate_user!
  def index    
    @calendar_message = CalendarMessage.new
    @calendar = Calendar.find(params[:calendar_id])
    #message保存用のdb（CalendarMessageモデル）新規作成？
    @calendar_messages = CalendarMessage.where(calendar_id: params[:calendar_id]).order(updated_at: :desc)
    #予定ごとのメッセージ履歴を引っ張る
  end

  def create
    @calendar_message = CalendarMessage.create(calendar_message_params)
  #任意のmessagedb（CalendarMessageモデル）にmessageを追加？
    redirect_to calendar_calendar_messages_path
  end

  def destroy
    @calendar_message = CalendarMessage.find(params[:id])
    @calendar_message.destroy
    redirect_to calendar_calendar_messages_path, notice:"削除しました"
  end

  def calendar_message_params
    params.require(:calendar_message).permit(:message, :image)
    .merge(user_id: current_user.id, calendar_id: params[:calendar_id])
  end
end
