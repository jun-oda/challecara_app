class CalendarMessage < ApplicationRecord 

  validates :message, presence: true, unless: :image?
  belongs_to :user
  belongs_to :calendar
  belongs_to :group
end
