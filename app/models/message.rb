class Message < ApplicationRecord
  belongs_to :calendar, optional: true
end
