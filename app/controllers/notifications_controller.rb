class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications #.page(params[:page]).per(20)
    @notification = Notifications.find(params[:calendar_message_id])
    @notifications.where(checked: false).each do |notification|
      Notifications.update_attributes(checked: true)
    end
  end
end
