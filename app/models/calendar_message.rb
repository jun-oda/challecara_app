class CalendarMessage < ApplicationRecord
  validates :message, presence: true, if: :image.blank?
  belongs_to :user
  belongs_to :calendar

  mount_uploader :image, ImageUploader

end
