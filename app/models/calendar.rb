class Calendar < ApplicationRecord
  has_many :calendar_messages
  belongs_to :group

  has_many :notifications, dependent: :destroy
end
