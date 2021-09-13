class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }
  mount_uploader :picture, PictureUploader
  default_scope  { order(created_at: :desc) }
end
