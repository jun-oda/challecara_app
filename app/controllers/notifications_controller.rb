class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.page(params[:page]).per(20)
    @notification = Notification.find(params[:calendar_message_id])
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
