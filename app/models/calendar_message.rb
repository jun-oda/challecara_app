class CalendarMessage < ApplicationRecord
  validates :message, presence: true, if: :image.blank?
  belongs_to :user
  belongs_to :calendar

  mount_uploader :image, ImageUploader

  has_one :notifications, dependent: :destroy

  def create_notification!(current_user)
    temp = Notification.where(["user_id = ? and calendar_messages_id = ? and action = ?", user_id, calendar_messages_id, 'notification'])

    if temp.blank?

      notification = current_user.active_notifications.new(
        user_id: user_id,
        calendar_messages_id: calendar_messages_id,
        action: 'notification'
      
      )
      notification.save if notification.valid?
    end
  end

end
