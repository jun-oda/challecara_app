class CreateNotification < ApplicationRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      #t.integer :calendar_messages_id, null: false
      t.string :action, default: ' ', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps

    end

    default_scope -> {order(created_at: :desc)}

    has_one :calendar_messages
    belongs_to :user
    belongs_to :calendar

    add_index :notifications, :calendar_messages_id

  end
end
