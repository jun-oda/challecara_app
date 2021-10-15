class CalendarMessagesController < ApplicationController
  def index
  end

  def create
  end

  def destroy
  end

  def calendar_message_parameter
    params.require(:calendar_message).permit(:message, :user_id, :created_at, :calendar_id)
  end
end
