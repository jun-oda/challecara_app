class Invite < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :group
end
