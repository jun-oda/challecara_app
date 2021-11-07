class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :group_users
  has_many :users, through: :group_users
  has_many :calendars
  #accepts_nested_attributes_for :group_users
end
