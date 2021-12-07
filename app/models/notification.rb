class CreateNotifications < ApplicationRecord
  default_scope -> {order(created_at: :desc)}
  has_one :calendar_messages
  has_one :calendar_id
  belongs_to :user
  belongs_to :calendar

end
