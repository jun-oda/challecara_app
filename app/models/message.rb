class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }

  def template
    ApplicationController.renderer.render partial: "messages/message", locals: { message: self }
  end
end
