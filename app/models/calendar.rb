class Calendar < ApplicationRecord
  has_many :calendar_messages
  belongs_to :group
end
