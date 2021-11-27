class CalendarMessage < ApplicationRecord
  validates :message_or_image_exist, presence: true
  
  belongs_to :user
  belongs_to :calendar

  mount_uploader :image, ImageUploader

  def message_or_image_exist
    message.presence or image.presence
  end
end
