class CalendarMessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    
    @calendar_message = CalendarMessage.new
    @calendar = Calendar.find(params[:calendar_id])
  end

  def create
    @calendar_message = CalendarMessage.create(calendar_message_params)
    redirect_to calendar_calendar_messages_path
  end

  def destroy
  end

  def calendar_message_params
    params.require(:calendar_message).permit(:message, :image)
    .merge(user_id: current_user.id, calendar_id: params[:calendar_id])
  end
end
