class Group < ApplicationRecord
# 〜省略〜
  has_many :group_users
  has_many :users, through: :group_users
  validates :name, presence: true, uniqueness: true
  has_many :calendar_messages  
end
