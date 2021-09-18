class Calendar < ApplicationRecord
  has_many :messages, dependent: :destroy
end
