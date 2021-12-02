class Calendar < ApplicationRecord
  has_many :calendar_messages, dependent: :destroy
  belongs_to :group
end
