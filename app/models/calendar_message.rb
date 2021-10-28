class CalendarMessage < ApplicationRecord
  validates :message, presence: true
  belongs_to :user
  belongs_to :calendar
end
