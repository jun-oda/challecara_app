class Calendar < ApplicationRecord
  has_one :calendar_message
  belongs_to :group
end
