class NotificationController < ApplicationController
  def index
    @notifications = user.notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
