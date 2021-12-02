class Group < ApplicationRecord
  validates :name, presence: true

  has_many :invites
  has_many :group_users
  has_many :users, through: :group_users
  has_many :calendars, dependent: :destroy
  #accepts_nested_attributes_for :group_users
end
